//
//  DieModel.swift
//  RollDice
//
//  Created by Andrea Telatin (QIB) on 20/11/2024.
//


import Foundation

struct DieModel {
    // Current face value of the die
    private(set) var currentValue: Int
    // Number of sides on the die
    let sides: Int
    
    init(sides: Int = 6) {
        self.sides = sides
        self.currentValue = Int.random(in: 1...sides)
    }
    
    // Method to roll the die
    mutating func roll() {
        currentValue = Int.random(in: 1...sides)
    }
}
