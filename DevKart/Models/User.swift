//
//  User.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//

import SwiftUI
import Combine

struct User: Codable {
    let id : UUID
    let username: String
    let email: String
}
