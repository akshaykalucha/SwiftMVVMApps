//
//  WordleView.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 24/02/22.
//

import SwiftUI

struct WordleView: View {
    
    @EnvironmentObject var dm: WordleDataModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(spacing: 3) {
                    ForEach(0...5, id:\.self) { index in
                        GuessView(guess: $dm.guesses[index])
                            .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                    }
//                    GuessView(guess: $dm.guesses[0])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[0])))
//                    GuessView(guess: $dm.guesses[1])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[0])))
//                    GuessView(guess: $dm.guesses[2])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[0])))
//                    GuessView(guess: $dm.guesses[3])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[0])))
//                    GuessView(guess: $dm.guesses[4])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[0])))
//                    GuessView(guess: $dm.guesses[5])
//                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[0])))
                }
                .frame(width: Global.boardWidth, height: 6*Global.boardWidth / 5)
                Spacer()
                KeyBoard()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("WORDLE")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "chart.bar")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct WordleView_Previews: PreviewProvider {
    static var previews: some View {
        WordleView()
            .environmentObject(WordleDataModel())
    }
}
