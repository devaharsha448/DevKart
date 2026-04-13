//
//  PasswordHasher.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//


import CryptoKit
import SwiftUI

struct PasswordHasher {
    
    static func hash(_ password: String) -> String {
        let data = Data(password.utf8)
        let hashed = SHA256.hash(data: data)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
    
    static func verify(password: String, storedHash: String) -> Bool {
        return hash(password) == storedHash
    }
}
