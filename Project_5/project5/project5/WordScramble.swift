//
//  WordScramble.swift
//  project5
//
//  Created by MICHAIL SHAKHVOROSTOV on 12.09.2023.
//

import SwiftUI


struct WordScramble: View {
    
    @State var usedWord = [String]()
    @State var rootWord = ""
    @State var newWord = ""
    
    @State var errorTitle = ""
    @State var errorMessage = ""
    @State var showingError = false
    
    @State var score: Int = 0
    
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter you word", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(usedWord, id: \.self) {word in
                        HStack {
                            Image(systemName: "\(word.count).square.fill")
                            Text(word)
                        }
                        
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWOrd)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("Ok", role: .cancel){}
            } message: {
                Text("\(errorMessage)")
            }
            .toolbar{
                Button("Restart game", action: startGame)
            }
            
            Spacer()
            
            Text("Your score \(score)")
                .font(.largeTitle)
        }
    }
    
}

#Preview {
    WordScramble()
}
