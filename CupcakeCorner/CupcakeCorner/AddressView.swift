//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Anmol Chawla on 10/08/24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form(content: {
            Section(content: {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            })
            
            Section(content: {
                NavigationLink("Check out", destination: {
                    CheckoutView(order: order)
                })
            })
        })
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
