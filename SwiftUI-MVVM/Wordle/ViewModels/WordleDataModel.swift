//
//  WordleDataModel.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 24/02/22.
//

import SwiftUI


class WordleDataModel: ObservableObject {
    @Published var guessesMade: String = ""
}
