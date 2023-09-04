//
//  GuessFlagView.swift
//  GuessTheFlag
//
//  Created by MICHAIL SHAKHVOROSTOV on 30.08.2023.
//

import SwiftUI
import ConfettiSwiftUI


struct GuessFlagView: View {
    
    @State private var showningScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var answerMessage = ""
    
    @State private var countries = ["Estonia", "Poland", "Russia", "US", "UK", "Nigeria", "Spain", "France", "Germany", "Ireland", "Italy"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
           // LinearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom)
            RadialGradient(colors: [Color("BackBlue"),
                                    Color("BackRed")],
                           center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
                
            
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                
                VStack(spacing: 30) {
                    VStack(spacing: 10) {
                        Text("Tap of correct")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.white)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.white)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            print(number)
                            tapFlag(number)
                            print(countries[correctAnswer])
                            print(correctAnswer)
                        
                            
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 10)
                            
                               // .border(.gray, width: 1)
                        }
                        .confettiCannon(counter: $score, fadesOut: true)
                        .confettiCannon(counter: $score, confettis: [.image("\(countries[correctAnswer])")], confettiSize: 20)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                
                Spacer()
                
                Text("Your score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
            .padding(20)
            
            
        }
        .alert("Your answer - \(scoreTitle)", isPresented: $showningScore) {
            Button("Continue") {
                askForQuestion()
            }
        } message: {
            Text(answerMessage)
        }
    }
    
}


extension GuessFlagView {
    
    func tapFlag(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            
            score += 1
            answerMessage = "Your you score \(score)"
        } else {
            scoreTitle = "Wrong"
            answerMessage = "This is flag - \(countries[number])"
        }
        showningScore = true
        print(scoreTitle)
    }
    
    
    func askForQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}


#Preview {
    GuessFlagView()
}
