//
//  DieModel.swift
//  RollDice
//
//  Created by Andrea Telatin (QIB) on 20/11/2024.
//
import Foundation

struct DieModel {
    private(set) var currentValue: Int
    let sides: Int
    
    init(sides: Int = 6) {
        self.sides = sides
        self.currentValue = Int.random(in: 1...sides)
    }
    
    mutating func roll() {
        currentValue = Int.random(in: 1...sides)
    }
}
