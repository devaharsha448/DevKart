//
//  PermissionManager.swift
//  SwiftDataDemo
//
//  Created by Dumpa Deva Harsha on 24/03/26.
//

import Photos

class PhotoPermissionManager {
    
    static func requestPermission(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        
        switch status {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { newStatus in
                DispatchQueue.main.async {
                    completion(newStatus == .authorized || newStatus == .limited)
                }
            }
            
        case .authorized, .limited:
            completion(true)
            
        case .denied, .restricted:
            completion(false)
            
        @unknown default:
            completion(false)
        }
    }
}
