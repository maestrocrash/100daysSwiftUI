//
//  WeSplitView.swift
//  WeSplit
//
//  Created by MICHAIL SHAKHVOROSTOV on 23.08.2023.
//

import SwiftUI
import Charts



struct WeSplitView: View {
    
    struct ToyShape: Identifiable {
        var type: String
        var count: Double
        var id = UUID()
    }
    
    var data: [ToyShape] = [
        .init(type: "Cube", count: 5),
        .init(type: "Sphere", count: 4),
        .init(type: "Pyramid", count: 4)
    ]
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 15
    @FocusState private var amountIsFocused: Bool
    
    private var currencyInApp: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmoutAndTip: Double {
        let tipSelection = Double(tipPercentage)
        
        return checkAmount + (checkAmount / 100 * tipSelection)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Amount") {
                    TextField("Amount", value: $checkAmount, format: currencyInApp)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                }
                
                Section("Number of people"){
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much tip do you want leave?") {
                    Picker("Tip perchecntage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Amount per person"){
                    Text(totalPerPerson, format: currencyInApp)
                }
                
                Section("Check") {
                    Text(totalAmoutAndTip, format: currencyInApp)
                }
                .foregroundStyle(tipPercentage == 0 ? .red : .black)
                
                Section("Charts") {
                    Chart {
                        BarMark(
                            x: .value("Shape Type", "Tip"),
                            y: .value("Total Count", totalAmoutAndTip - checkAmount)
                        )
                        .foregroundStyle(.green)
                        BarMark(
                             x: .value("Shape Type", "PerPersone"),
                             y: .value("Total Count", totalPerPerson)
                        )
                        .foregroundStyle(.yellow)
                        BarMark(
                             x: .value("Shape Type", "Check"),
                             y: .value("Total Count", totalAmoutAndTip)
                        )
                        .foregroundStyle(.purple)
                    }
                    
                }
            }
            
            .navigationTitle("Split check")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
    
}


#Preview {
    WeSplitView()
}
