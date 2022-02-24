//
//  KeyBoard.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 24/02/22.
//

import SwiftUI

struct KeyBoard: View {
    @EnvironmentObject var dm: WordleDataModel
    var topRowArray = "QWERTYUIOP".map{ String($0) }
    var secondRowArray = "ASDFGHJKL".map{ String($0) }
    var thirdRowArray = "ZXCVBNM".map{ String($0) }
    var body: some View {
        VStack {
            HStack(spacing: 2){
                ForEach(topRowArray, id:\.self) { letter in
                    LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2){
                ForEach(secondRowArray, id:\.self) { letter in
                    LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2){
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width:60, height:50)
                .foregroundColor(.primary)
                .background(Color.unused)
                ForEach(thirdRowArray, id:\.self) { letter in
                    LetterButtonView(letter: letter)
                }
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 40, height: 50)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                }
            }
        }
    }
}

struct KeyBoard_Previews: PreviewProvider {
    static var previews: some View {
        KeyBoard()
            .environmentObject(WordleDataModel())
    }
}
