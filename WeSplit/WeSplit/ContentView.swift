//
//  ContentView.swift
//  WeSplit
//
//  Created by Anmol Chawla on 27/05/23.
//

import SwiftUI

struct ContentView: View {
    let peopleCountList: [Int] = [Int](2..<100)
    let currencyIdentifier: String = Locale.current.currency?.identifier ?? "USD"
    
    @State private var checkAmount: Double = 0.0
    @State private var peopleCountIndex: Int = 0
    @State private var tipPercentage:Int = 20
    
    @FocusState private var checkAmountFocus: Bool
    
    var numPeople: Double {
        Double(peopleCountList[peopleCountIndex])
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var totalPerPerson: Double {
        grandTotal / numPeople
    }
    
    var body: some View {
        NavigationView(
            content: {
                Form {
                    Section {
                        TextField(
                            "Amount",
                            value: $checkAmount,
                            format: .currency(
                                code: currencyIdentifier
                            )
                        )
                        .keyboardType(.decimalPad)
                        .focused($checkAmountFocus)
                        
                        Picker("Number of people", selection: $peopleCountIndex) {
                            ForEach(peopleCountList, id: \.self) {
                                Text("\($0) people")
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    Section(
                        content: {
                            Picker("Tip percentage", selection: $tipPercentage) {
                                ForEach(0..<101) {
                                    Text($0, format: .percent)
                                }
                            }
                            .pickerStyle(.wheel)
                        },
                        header: {
                            Text("How much do you want to tip?")
                                .textCase(.none)
                        }
                    )
                    
                    Section(
                        content: {
                            Text(
                                grandTotal,
                                format: .currency(
                                    code: currencyIdentifier
                                )
                            )
                        },
                        header: {
                            Text("Total amount")
                                .textCase(.none)
                        }
                    )
                    
                    Section(
                        content: {
                            Text(
                                totalPerPerson,
                                format: .currency(
                                    code: currencyIdentifier
                                )
                            )
                        },
                        header: {
                            Text("Amount per person")
                                .textCase(.none)
                        }
                    )
                }
                .navigationTitle("WeSplit")
                .toolbar(
                    content: {
                        ToolbarItemGroup(
                            placement: .keyboard,
                            content: {
                                Spacer()
                                
                                Button("Done") {
                                    checkAmountFocus = false
                                }
                            }
                        )
                    }
                )
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
