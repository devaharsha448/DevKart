//
//  UserDefaultManager.swift
//  CustomComponents&Views
//
//  Created by Dumpa Deva Harsha on 31/03/26.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    // MARK: Save
    func save<T: Encodable>(_ value: T, forKey key: String) {
        do {
            let data = try JSONEncoder().encode(value)
            defaults.set(data, forKey: key)
        } catch {
            print("❌ Save Error:", error)
        }
    }
    
    // MARK: Load
    func load<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = defaults.data(forKey: key) else { return nil }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("❌ Load Error:", error)
            return nil
        }
    }
    
    // MARK: Remove
    func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
