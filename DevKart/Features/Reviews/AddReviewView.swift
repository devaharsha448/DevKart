//
//  AddReviewView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 15/04/26.
//


import SwiftUI

struct AddReviewView: View {
    
    let productId: UUID
    var existingReview: ReviewModel? = nil   // NEW
    
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var reviewVM: ReviewViewModel
    
    @State private var rating = 0
    @State private var comment = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(existingReview == nil ? "Add Review" : "Edit Review")
                .font(.headline)
            
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
            
            Button(existingReview == nil ? "Submit" : "Update") {
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
        .onAppear {
            // Prefill if editing
            if let review = existingReview {
                rating = review.rating
                comment = review.comment
            }
        }
    }
    
    private func save() {
        guard let user = authVM.user else { return }
        
        if let review = existingReview {
            // UPDATE
            reviewVM.updateReview(
                review: review,
                rating: rating,
                comment: comment,
                context: context
            )
        } else {
            // ADD
            reviewVM.addReview(
                productId: productId,
                user: user,
                rating: rating,
                comment: comment,
                context: context
            )
        }
        
        dismiss()
    }
}
