import Foundation

final class AuthService {
    
    static let shared = AuthService()
    
    private init() {}
    
    func login(username: String, password: String) async throws -> User {
        
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        if username == "admin" && password == "1234" {
            return User(
                id: UUID().uuidString,
                username: username,
                email: "admin@mail.com",
                phone: nil,
                profileImageURL: nil,
                createdAt: Date()
            )
        } else {
            throw NSError(domain: AppStrings.invalidCredentials, code: 401)
        }
    }
    
}
