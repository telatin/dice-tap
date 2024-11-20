//
//  DieView.swift
//  RollDice
//
//  Created by Andrea Telatin (QIB) on 20/11/2024.
//


// DieView.swift
import SwiftUI

struct DieView: View {
    // The die's face value to display
    let value: Int
    
    // Convert numeric value to dice face emoji
    private func getDieFace(_ value: Int) -> String {
        switch value {
            case 1: return "⚀"
            case 2: return "⚁"
            case 3: return "⚂"
            case 4: return "⚃"
            case 5: return "⚄"
            case 6: return "⚅"
            default: return "?"
        }
    }
    
    var body: some View {
        ZStack {
            // Die background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 5)
                .frame(width: 100, height: 100)
            
            // Die value as emoji
            Text(getDieFace(value))
                .font(.system(size: 70))  // Increased size for emoji
        }
    }
}
