//
//  ContentView.swift
//  betterRests
//
//  Created by Anmol Chawla on 07/01/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? .now
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
  
    var body: some View {
        NavigationStack {
            Form {
                
                VStack(
                    alignment: .leading,
                    spacing: 0,
                    content: {
                        Text("When do you want to wake up?")
                        .font(.headline)
                    
                        DatePicker(
                            "Please enter a time",
                            selection: $wakeUp,
                            displayedComponents: .hourAndMinute
                        )
                        .labelsHidden()
                    }
                )
                
                VStack(
                    alignment: .leading,
                    spacing: 0,
                    content: {
                        Text("Desired amount of sleep")
                            .font(.headline)
                        
                        Stepper(
                            "\(sleepAmount.formatted()) hours",
                            value: $sleepAmount,
                            in: 4...12,
                            step: 0.25
                        )
                    }
                )
                
                VStack(
                    alignment: .leading,
                    spacing: 0,
                    content: {
                        Text("Daily coffee intake")
                            .font(.headline)
                        
                        Stepper(
                            "^[\(coffeeAmount) cup](inflect: true)",
                            value: $coffeeAmount,
                            in: 1...20
                        )
                    }
                )
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button(
                    "Caculate",
                    action: caculateBedtime
                )
            }
            .alert(
                alertTitle,
                isPresented: $showingAlert,
                actions: { Button("OK") {} },
                message: { Text(alertMessage) }
            )
        }
    }
    
    func caculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Int64(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Int64(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
