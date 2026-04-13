//
//  PriceRow.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//

import SwiftUI

struct PriceRow: View {
    let title: String
    let value: Double
    var isBold: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(isBold ? .headline : .subheadline)
            
            Spacer()
            
            Text("$\(value, specifier: "%.2f")")
                .font(isBold ? .headline : .subheadline)
        }
    }
}
