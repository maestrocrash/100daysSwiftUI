//
//  TempView.swift
//  tempApp
//
//  Created by MICHAIL SHAKHVOROSTOV on 27.08.2023.
//

import SwiftUI

struct TempView: View {
    
    @State private var convertFrom = ""
    @State private var convertTo = ""
    @State private var temperature: Float = 0.0
    
    var tempSelections = ["°С", "°F", "K"]
    
    var result: Float {
       
        var resulTemp: Float = 0
        
        switch convertFrom {
            case "°С":
                if convertTo == "°F" {
                    resulTemp = 1.8 * temperature + 32
                } else if convertTo == "K" {
                    resulTemp = temperature + 273.15
                }
            case "°F":
                if convertTo == "°С" {
                    resulTemp = temperature
                } else if convertTo == "K" {
                    resulTemp = (temperature + 459.67) * 5/9
                }
            case "K": 
                if convertTo == "°F" {
                    resulTemp = (temperature - 273.15) * 9/5 + 32
                } else if convertTo == "°С" {
                    resulTemp = temperature - 273.15
                }
   
        default:
            resulTemp = temperature
        }
        
        
        return resulTemp
    }
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                Section("Convertion from") {
                    Picker("Convertion from", selection: $convertFrom) {
                        ForEach(tempSelections, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Convertion to") {
                    Picker("Convertion to", selection: $convertTo) {
                        ForEach(tempSelections, id: \.self) {
                            Text($0)
                        }
                       
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result") {
                    
                    TextField("Temp", value: $temperature, format: .number)
                        .keyboardType(.decimalPad)
                    Text("Result convertion \(result.formatted()) \(convertTo)")
                }
            }
            .navigationTitle("Convertion temperature")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TempView()
}
