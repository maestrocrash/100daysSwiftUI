//
//  ContentView.swift
//  CapcakeCornerProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 27.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var order = Order()
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Ane special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraForsting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprikles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
                
            }
            .navigationTitle("Cupcake Corner")
        }
        
    }
}

#Preview {
    ContentView()
}
