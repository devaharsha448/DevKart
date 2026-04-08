//
//  MainTab.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//


enum MainTab: CaseIterable {
    case home, play, categories, account, cart
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .play: return "play.circle"
        case .categories: return "square.grid.2x2"
        case .account: return "person"
        case .cart: return "cart"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .play: return "Play"
        case .categories: return "Categories"
        case .account: return "Account"
        case .cart: return "Cart"
        }
    }
}