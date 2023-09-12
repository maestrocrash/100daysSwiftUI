//
//  workinString.swift
//  project5
//
//  Created by MICHAIL SHAKHVOROSTOV on 11.09.2023.
//

import SwiftUI


struct workString: View {
    var body: some View {
        Text("String")
        
        Button("Tap") {
            test()
        }
        .buttonStyle(.plain)
    }
    
    func test() {
        
        let stringTest = "a b c"
        
        //убираем пробелы, /n убрать перенос строки
        //let lettters = stringTest.components(separatedBy: " ")
        
        //обрезаем элементы
        let trimmed = stringTest.trimmingCharacters(in: .whitespacesAndNewlines)
        print(trimmed)
        
    }
    
    func test2() {
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let missingWord = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
     
        let allGood = missingWord.location == NSNotFound
        print(allGood)
        
        
    }
}


#Preview {
    workString()
}
