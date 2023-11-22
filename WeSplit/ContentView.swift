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
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                }
            }
            .navigationTitle("Include WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
