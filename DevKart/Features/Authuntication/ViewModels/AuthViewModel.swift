//
//  AuthViewModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//
import SwiftUI
import Combine

@MainActor
final class AuthViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    
    @AppStorage(StorageKeys.isLoggedIn) private var isLoggedInStorage = false
    @AppStorage(StorageKeys.userData) private var userDataStorage: Data?
    
    var isLoggedIn: Bool {
        user != nil
    }
    
    init() {
        loadUserFromStorage()
    }
    

    func login(username: String, password: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let user = try await AuthService.shared.login(
                username: username,
                password: password
            )
            
            self.user = user
            saveUserToStorage(user)
            isLoggedInStorage = true
            
        } catch {
            errorMessage = AppStrings.invalidCredentials
        }
        
        isLoading = false
    }
    

    func logout() {
        user = nil
        isLoggedInStorage = false
        userDataStorage = nil
    }
    private func saveUserToStorage(_ user: User) {
        do {
            let data = try JSONEncoder().encode(user)
            userDataStorage = data
        } catch {
            print(AppStrings.failedToSaveUser)
        }
    }
    
    private func loadUserFromStorage() {
        
        guard isLoggedInStorage,
              let data = userDataStorage else { return }
        
        do {
            let savedUser = try JSONDecoder().decode(User.self, from: data)
            self.user = savedUser
        } catch {
            print(AppStrings.failedToLoadUser)
        }
    }
}
