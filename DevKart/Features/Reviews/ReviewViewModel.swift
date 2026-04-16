//
//  ReviewViewModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 15/04/26.
//


import SwiftUI
import SwiftData
import Combine

@MainActor
final class ReviewViewModel: ObservableObject {
    
    @Published var reviews: [ReviewModel] = []
    
    private let dataManager = SwiftDataManager()
    
    func loadReviews(productId: UUID, context: ModelContext) {
        let descriptor = FetchDescriptor<ReviewModel>(
            predicate: #Predicate { $0.productId == productId }
        )
        
        do {
            reviews = try context.fetch(descriptor)
            print("📦 Loaded reviews:", reviews.count)
            print("Fetching for productId:", productId)
        } catch {
            print("❌ Fetch error:", error)
        }
    }
    
    func userReview(userId: String) -> ReviewModel? {
        reviews.first { $0.userId == userId }
    }
    
    func addReview(productId: UUID, user: UserModel, rating: Int, comment: String, context: ModelContext) {
        
        guard userReview(userId: user.id) == nil else { return }
        
        let review = ReviewModel(
            productId: productId,
            userId: user.id,
            username: user.username,
            rating: rating,
            comment: comment
        )
        
        context.insert(review)
        try? context.save()
        print("Saved productId:", productId)
        loadReviews(productId: productId, context: context)
    }
    
    func deleteReview(_ review: ReviewModel, context: ModelContext) {
        context.delete(review)
        try? context.save()
        
        reviews.removeAll { $0.id == review.id }
    }
}
