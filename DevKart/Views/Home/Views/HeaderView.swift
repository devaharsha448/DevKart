//
//  HeaderView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI

struct HeaderView: View {
    
    var notificationCount: Int = 3   // later from ViewModel
    var onNotificationTap: () -> Void = {}  // navigation handler
    
    var body: some View {
        HStack {
            
           
            VStack(alignment: .leading) {
                Text("Location")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text("New York, USA")
                    .font(.headline)
            }
            
            Spacer()
            
          
            Button(action: {
                onNotificationTap()
            }) {
                ZStack(alignment: .topTrailing) {
                    
                    Image(systemName: "bell")
                        .font(.title3)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                    
                
                    if notificationCount > 0 {
                        Text("\(notificationCount)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 8, y: -8)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
