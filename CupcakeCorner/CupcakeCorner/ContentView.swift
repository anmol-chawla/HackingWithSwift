//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Anmol Chawla on 08/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
       NavigationStack(root: {
           Form(content: {
               Section(content: {
                   Picker(
                    "Select your cake type",
                    selection: $order.type,
                    content: {
                        ForEach(Order.types.indices, id: \.self, content: {
                            Text(Order.types[$0])
                        })
                    }
                  )
                   
                   Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
               })
               
               Section(content: {
                   Toggle(
                    "Any special requests?",
                    isOn: $order.specialRequestsEnabled
                   )
                   
                   if order.specialRequestsEnabled {
                       Toggle(
                        "Add extra frosting",
                        isOn: $order.extraFrosting
                       )
                       
                   Toggle(
                        "Add extra sprinkles",
                        isOn: $order.addSprinkles
                       )
                   }
               })
               
               Section(content: {
                   NavigationLink("Delivery Details", destination: {
                       AddressView(order: order)
                   })
               })
           })
           .navigationTitle("Cupcake Corner")
       })
    }
}

#Preview {
    ContentView()
}
