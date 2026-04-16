//
//  AddReviewView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 15/04/26.
//


import SwiftUI

struct AddReviewView: View {
    
    let productId: UUID
    
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var reviewVM: ReviewViewModel
    
    @State private var rating = 0
    @State private var comment = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Add Review")
                .font(.headline)
            
            // ⭐ Rating
            HStack {
                ForEach(1...5, id: \.self) { star in
                    Image(systemName: star <= rating ? "star.fill" : "star")
                        .onTapGesture {
                            rating = star
                        }
                }
            }
            
            TextField("Write your review", text: $comment)
                .textFieldStyle(.roundedBorder)
            
            Button("Submit") {
                save()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
    
    private func save() {
        guard let user = authVM.user else { return }
        
        reviewVM.addReview(
            productId: productId,
            user: user,
            rating: rating,
            comment: comment,
            context: context
        )
        
        dismiss()
    }
}