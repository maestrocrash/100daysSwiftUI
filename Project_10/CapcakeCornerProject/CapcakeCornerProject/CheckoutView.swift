//
//  CheckoutView.swift
//  CapcakeCornerProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 29.09.2023.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    
    @State private var configutationMessage = ""
    @State private var showingConfirmation = false
    
    @State private var showAlert = false
    
    var body: some View {
        
        let urlImage = URL(string: "https://hws.dev/img/cupcakes@3x.jpg")
        
        ScrollView {
            VStack {
                AsyncImage(url: urlImage,scale: 3) {image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .padding()
                .alert("Error", isPresented: $showAlert) {
                    Button("Ok") {}
                } message: {
                    Text("Check connection Internet")
                }
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you", isPresented: $showingConfirmation) {
            Button("OK") {}
        }message: {
            Text(configutationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Errod encode")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
       // request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decoderOrder = try JSONDecoder().decode(Order.self, from: data)
            configutationMessage = "Your order for \(decoderOrder.quantity)x \(Order.types[decoderOrder.type].lowercased())"
            showingConfirmation = true
        } catch {
            print("Checkout failed")
        }
    }
}

#Preview {
    NavigationStack {
        CheckoutView(order: Order())
    }
}
