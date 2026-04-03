//
//  NetWorkManager.swift
//  SwiftDataDemo
//
//  Created by Dumpa Deva Harsha on 23/03/26.
//

import Foundation
import SwiftUI


@MainActor
class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let session = URLSession.shared
    
    // MARK: - GET Request
    func get<T: Decodable>(url: String) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            
            try validateResponse(response)
            
            return try decode(data)
            
        } catch {
            throw handleError(error)
        }
    }
    
    // MARK: - POST / PUT / DELETE
    func send<T: Decodable>(
        url: String,
        method: HTTPMethod,
        body: Data? = nil,
        headers: [String: String]? = nil
    ) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        headers?.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        do {
            let (data, response) = try await session.data(for: request)
            
            try validateResponse(response)
            
            return try decode(data)
            
        } catch {
            throw handleError(error)
        }
    }
}

extension NetworkManager {
    
    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.statusCode(httpResponse.statusCode)
        }
    }
    
    private func decode<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed(error)
        }
    }
    
    private func handleError(_ error: Error) -> NetworkError {
        if let error = error as? NetworkError {
            return error
        } else {
            return .requestFailed(error)
        }
    }
}

enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decodingFailed(Error)
    case requestFailed(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .statusCode(let code):
            return "Status Code: \(code)"
        case .decodingFailed(let error):
            return "Decoding Failed: \(error.localizedDescription)"
        case .requestFailed(let error):
            return error.localizedDescription
        }
    }
}
