// DieView.swift
import SwiftUI

struct DieView: View {
    // The die's face value to display
    let value: Int
    
    var body: some View {
        ZStack {
            // Die background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 5)
                .frame(width: 100, height: 100)
            
            // Die value
            Text("\(value)")
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.black)
        }
    }
}
