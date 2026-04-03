//
//  NotificationManager.swift
//  ProfilepgWthPerm
//
//  Created by Dumpa Deva Harsha on 26/03/26.
//

import UserNotifications
import UserNotifications

class NotificationManager {
    
    static func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if granted {
                print("Permission granted")
            } else {
                print("Permission denied")
            }
        }
    }
    
    static func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Hello 👋"
        content.body = "You clicked the button!"
        content.sound = .default
        
        // Trigger after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
}
