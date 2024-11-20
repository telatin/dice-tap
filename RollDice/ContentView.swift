//
//  ContentView 2.swift
//  RollDice
//
//  Created by Andrea Telatin (QIB) on 20/11/2024.
//


// ContentView.swift
import SwiftUI

struct ContentView: View {
    // State object to handle die model
    @State private var dieModel = DieModel()
    // State for handling animation
    @State private var isRolling = false
    
    var body: some View {
        VStack(spacing: 30) {
            // Title
            Text("Dice Roller")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Die view
            DieView(value: dieModel.currentValue)
                .rotation3DEffect(
                    .degrees(isRolling ? 360 : 0),
                    axis: (x: 1.0, y: 1.0, z: 0.0)
                )
                .animation(
                    isRolling ?
                        .linear(duration: 0.5)
                        .repeatCount(2, autoreverses: false) :
                        .default,
                    value: isRolling
                )
            
            // Roll button
            Button(action: rollDie) {
                Text("Roll Die")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .disabled(isRolling)
        }
        .padding()
    }
    
    // Function to handle die rolling with animation
    private func rollDie() {
        isRolling = true
        
        // Delay the actual value change until animation is nearly complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            dieModel.roll()
        }
        
        // Reset rolling state after animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isRolling = false
        }
    }
}

// STEP 5: Preview Provider
// Add this at the bottom of ContentView.swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
