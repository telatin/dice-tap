//
//  DieView.swift
//  RollDice
//
//  Created by Andrea Telatin (QIB) on 20/11/2024.
//


// DieView.swift
import SwiftUI

struct DieView: View {
    let value: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 5)
                .frame(width: 120, height: 120)
            
            Text(getDieFace(value))
                .font(.system(size: 70))
        }
    }
    
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
}
