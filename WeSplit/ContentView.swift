//
//  ContentView.swift
//  WeSplit
//
//  Created by Bruno Oliveira on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var totalPlusTip: Double {
        checkAmount + (checkAmount * Double(tipPercentage) / 100)
    }
    
    var currencyStandard: String {
        Locale.current.currency?.identifier ?? "BRL"
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Check Amount and number of People:") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much tip do you want to Leave?"){
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("The Amount per Person is:") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                        .foregroundStyle(tipPercentage == 0 ? .red : .primary)
                }
                Section("Sumary of the Amount Check:"){
                    Text("Total Amount + Tip:")
                    Text(totalPlusTip, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                    Text("Tip selected: \(tipPercentage) %")
                    Text("People to Split: \(numberOfPeople + 2)")
                }
            }
            Text("Version: V1.1")
            .navigationTitle("Include WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
