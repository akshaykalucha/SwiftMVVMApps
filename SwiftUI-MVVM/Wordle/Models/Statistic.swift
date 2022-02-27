//
//  Statistic.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 27/02/22.
//

import Foundation

struct Statistic: Codable {
    var frequency = [Int](repeating: 0, count: 6)
    var games = 0
    var streak = 0
    var maxStreak = 0
    var wins: Int {
        frequency.reduce(0, +)
    }
    
    func saveState() {
        if let encoded = try? JSONEncoder().encode(self){
            UserDefaults.standard.set(encoded, forKey: "stat")
        }
    }
    static func loadStat() -> Statistic {
        if let savedStat = UserDefaults.standard.object(forKey: "stat") as? Data {
            if let currentStat = try? JSONDecoder().decode(Statistic.self, from: savedStat){
                return currentStat
            } else{
                return Statistic()
            }
        } else {
            return Statistic()
        }
    }
    mutating func update(win: Bool, index: Int? = nil) {
        games += 1
        streak = win ? streak + 1 : 0
        if win {
            frequency[index!] += 1
            maxStreak = max(maxStreak, streak)
        }
        saveState()
    }
}
