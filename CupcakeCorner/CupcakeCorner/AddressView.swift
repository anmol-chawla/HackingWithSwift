//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Anmol Chawla on 10/08/24.
//

import SwiftUI

struct AddressView: View {
    var order: Order
    
    var body: some View {
        NavigationStack(root: {
            Text(String(order.type))
        })
    }
}

#Preview {
    AddressView(order: Order())
}
