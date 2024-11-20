//
//  ContentView 2.swift
//  RollDice
//
//  Created by Andrea Telatin (QIB) on 20/11/2024.
//


// ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var dieModel = DieModel()
    @State private var isRolling = false
    @State private var rollHistory: [Int] = []
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Dice Roller")
                .font(.largeTitle)
                .fontWeight(.bold)
            
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
            
            if !rollHistory.isEmpty {
                VStack(alignment: .leading) {
                    Text("Last rolls:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    HStack(spacing: 8) {
                        ForEach(rollHistory.reversed(), id: \.self) { value in
                            Text(getDieFace(value))
                                .font(.system(size: 30))
                        }
                    }
                }
                .padding(.top, 20)
            }
        }
        .padding()
    }
    
    private func rollDie() {
        isRolling = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            dieModel.roll()
            rollHistory.append(dieModel.currentValue)
            if rollHistory.count > 6 {
                rollHistory.removeFirst()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isRolling = false
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

// STEP 5: Preview Provider
// Add this at the bottom of ContentView.swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
