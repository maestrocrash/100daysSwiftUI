//
//  traineCoreML.swift
//  project4
//
//  Created by MICHAIL SHAKHVOROSTOV on 08.09.2023.
//

import CoreML
import SwiftUI

struct TraineCoreML: View {
    
    @State private var wakeUp = defaultDate
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    @State private var titleAlert = ""
    @State private var messageAlert = ""
    @State private var statusAlert = false
    
    static var defaultDate: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    
    var timeSleep: String{
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalcalutor(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hours = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            
            let prediction = try model.prediction(wake: Double(hours + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            titleAlert = "Your ideal bedtime is ..."
            messageAlert = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            titleAlert = "Error"
            messageAlert = "Sorry, there was a problem calculating your bedtime."
        }
        statusAlert = true
        
        return messageAlert
        
//        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//        let hours = (components.hour ?? 0) * 60 * 60
//        let minute = (components.minute ?? 0) * 60
//        
//        
//        var testText = Calendar.current.date(from: components) ?? Date.now
//        
//        return "Your ideal bedtime is \(testText.formatted(date: .omitted, time: .shortened))"
        
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Pleate enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }

                Section("Desire amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section {
                    Text("Daily coffe cup intake")
                        .font(.headline)
                   
                   
                    Picker("CupOfCoffee", selection: $coffeAmount) {
                        ForEach(1..<20) {
                            Text("\($0) cup")
                        }
                    }
                }
                
                Section("Result sleep") {
                    Text("\(timeSleep)")
                }
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateRest)
            }
            .alert(titleAlert, isPresented: $statusAlert) {
                Button("Ok"){}
            } message: {
                Text(messageAlert)
            }
        }
    }
    
    func calculateRest() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalcalutor(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hours = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            
            let prediction = try model.prediction(wake: Double(hours + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            titleAlert = "Your ideal bedtime is ..."
            messageAlert = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            titleAlert = "Error"
            messageAlert = "Sorry, there was a problem calculating your bedtime."
        }
        statusAlert = true
    }
    
    func calculateRestTime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalcalutor(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hours = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            
            let prediction = try model.prediction(wake: Double(hours + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            titleAlert = "Your ideal bedtime is ..."
            messageAlert = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            titleAlert = "Error"
            messageAlert = "Sorry, there was a problem calculating your bedtime."
        }
        statusAlert = true
        
        return messageAlert
    }
    
}


#Preview {
    TraineCoreML()
}
