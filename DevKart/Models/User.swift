//
//  User.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//

import SwiftUI
import Combine

struct User: Codable, Identifiable {
    let id: String
    let username: String
    let email: String
    let phone: String?
    let profileImageURL: String?
    let createdAt: Date?
}
