//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Anmol Chawla on 10/08/24.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    var body: some View {
        ScrollView(content: {
            VStack(content: {
                AsyncImage(
                    url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),
                    scale: 2,
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                        
                    },
                    placeholder: {
                        ProgressView()
                    })
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {})
                    .padding()
            })
        })
        .scrollBounceBehavior(.basedOnSize)
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView(order: Order())
}
