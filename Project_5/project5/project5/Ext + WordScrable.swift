//
//  Ext + WordScrable.swift
//  project5
//
//  Created by MICHAIL SHAKHVOROSTOV on 12.09.2023.
//

import SwiftUI


extension WordScramble {
    func addNewWOrd() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {return}
        
        guard isTrueWord(word: answer) else {
            wordError(title: "Error", message: "No repeat at root word")
            return
        }
        
        guard isThree(word: answer) else {
            wordError(title: "Three letters minimum", message: "Error")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell thar word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognizer", message: "You can't just make them up, you know!")
            return
        }
        
        score += answer.count
        
        withAnimation {
            usedWord.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        if let wordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let words = try? String(contentsOf: wordsUrl) {
                let allWords = words.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle")
      
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWord.contains(word)
    }
    
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func isThree(word: String) -> Bool {
        
        if word.count <= 2 {
            return false
        }
        
        return true
    }
    
    func isTrueWord(word: String) -> Bool {
        if word == rootWord {
            return false
        }
        
        return true
    }
}
