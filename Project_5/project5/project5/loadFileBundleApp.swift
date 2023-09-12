//
//  loadFileBundleApp.swift
//  project5
//
//  Created by MICHAIL SHAKHVOROSTOV on 11.09.2023.
//

import SwiftUI


struct loadFileBundle: View {
    
    var body: some View {
        Text("Text")
        
        Button("File load") {
            loadFile()
        }
    }
 
    func loadFile() {
        
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContent = try? String(contentsOf: fileURL) {
                print(fileContent)
            }
        }
        
    }
    
}


#Preview {
    loadFileBundle()
}
