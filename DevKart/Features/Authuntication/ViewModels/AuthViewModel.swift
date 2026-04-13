//
//  AuthViewModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//
import SwiftUI
import Combine
import SwiftData

@MainActor
final class AuthViewModel: ObservableObject {
    
    @Published var user: UserModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    
    
    @AppStorage(StorageKeys.userId) private var storedUserId: String?
    
    var isLoggedIn : Bool {
        user != nil
    }
    
    func loadUser(context: ModelContext) {
        guard let id = storedUserId else { return }
        
        let descriptor = FetchDescriptor<UserModel>(
            predicate: #Predicate { $0.id == id }
        )
        
        user = try? context.fetch(descriptor).first
    }
    
    // LOGIN
    func login(username: String, password: String, context: ModelContext) async {
        isLoading = true
        
        do {
            let user = try AuthRepository.shared.login(
                username: username,
                password: password,
                context: context
            )
            
            self.user = user
            storedUserId = user.id
            
        } catch {
            errorMessage = AppStrings.invalidCredentials
        }
        
        isLoading = false
    }
    
    // SIGNUP
    func signup(username: String, email: String, password: String, context: ModelContext) async {
        isLoading = true
        
        do {
            let user = try AuthRepository.shared.signup(
                username: username,
                email: email,
                password: password,
                context: context
            )
            
            self.user = user
            storedUserId = user.id
            
        } catch {
            errorMessage = AppStrings.userExists
        }
        
        isLoading = false
    }
    
    // LOGOUT
    func logout() {
        user = nil
        storedUserId = nil
    }
    
    func printAllUsers(context: ModelContext){
        AuthRepository.shared.printAllUsers(context: context)
    }
}
