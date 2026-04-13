//
//  AuthError.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//


enum AuthError: Error {
    case userNotFound
    case invalidCredentials
    case userAlreadyExists
}