//
//  ReviewSectionView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//
import SwiftUI
import SwiftData

struct ReviewSectionView: View {
    
    let product: Product
    
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.modelContext) var context
    
    @StateObject private var reviewVM = ReviewViewModel()
    
    @State private var showAdd = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Title + Add Button
            HStack {
                Text("Reviews")
                    .font(.headline)
                
                Spacer()
                
                if authVM.user != nil {
                    Button("+ Add") {
                        showAdd = true
                    }
                }
            }
            
            // Reviews List
            if reviewVM.reviews.isEmpty {
                Text("No reviews yet")
                    .foregroundColor(.gray)
            } else {
                ForEach(reviewVM.reviews) { review in
                    
                    VStack(alignment: .leading) {
                        
                        // 🔁 Reuse your existing UI
                        ReviewCardView(
                            name: review.username,
                            rating: review.rating,
                            comment: review.comment
                        )
                        
                        // ✅ Owner controls
                        if review.userId == authVM.user?.id {
                            
                            HStack {
                                Button("Delete") {
                                    reviewVM.deleteReview(review, context: context)
                                }
                                .foregroundColor(.red)
                            }
                            .padding(.leading, 10)
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        
        // Load reviews
        .onAppear {
            reviewVM.loadReviews(productId: product.id, context: context)
        }
        
        // Add Review Sheet
        .sheet(isPresented: $showAdd) {
            AddReviewView(productId: product.id, reviewVM: reviewVM)
        }
    }
}
