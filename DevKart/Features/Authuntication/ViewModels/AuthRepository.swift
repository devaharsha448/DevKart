//
//  AuthRepository.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//


import SwiftData
import SwiftUI

final class AuthRepository {
    
    static let shared = AuthRepository()
    
    private init() {}
    
    // LOGIN
    func login(
        username: String,
        password: String,
        context: ModelContext
    ) throws -> UserModel {
        
        let descriptor = FetchDescriptor<UserModel>(
            predicate: #Predicate { $0.username == username }
        )
        
        guard let user = try context.fetch(descriptor).first else {
            throw AuthError.userNotFound
        }
        
        let hashed = PasswordHasher.hash(password)
        
        guard user.passwordHash == hashed else {
            throw AuthError.invalidCredentials
        }
        
        return user
    }
    
    // SIGNUP
    func signup(
        username: String,
        email: String,
        password: String,
        context: ModelContext
    ) throws -> UserModel {
        
        let descriptor = FetchDescriptor<UserModel>(
            predicate: #Predicate { $0.username == username }
        )
        
        if try context.fetch(descriptor).first != nil {
            throw AuthError.userAlreadyExists
        }
        
        let user = UserModel(
            id: UUID().uuidString,
            username: username,
            email: email,
            passwordHash: PasswordHasher.hash(password)
        )
        
        context.insert(user)
        try context.save()
        
        return user
    }
}
