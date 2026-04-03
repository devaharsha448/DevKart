//
//  NotificationManager.swift
//  CustomComponents&Views
//
//  Created by Dumpa Deva Harsha on 31/03/26.
//

import Foundation
import Combine

final class NotificationCentreManager {
    
    static let shared = NotificationManager()
    
    private init() {}
    
    // MARK: - Post Notification
    func post(name: Notification.Name, userInfo: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(
            name: name,
            object: nil,
            userInfo: userInfo
        )
    }
    
    // MARK: - Publisher
    func publisher(for name: Notification.Name) -> NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: name)
    }
}

extension Notification.Name {
    
    static let userLoggedIn = Notification.Name("userLoggedIn")
    static let userLoggedOut = Notification.Name("userLoggedOut")
    static let themeChanged = Notification.Name("themeChanged")
}
