//
//  WordleDataModel.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 24/02/22.
//

import SwiftUI


class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    
    init() {
        newGame()
    }
    
    func newGame() {
        populateDefaults()
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
    }
}
