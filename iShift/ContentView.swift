//
//  ContentView.swift
//  iShift
//
//  Created by Matteo on 30/09/2021.
//

import SwiftUI

struct Shift: Identifiable {
    let id = UUID()
    let date: String
    let store: String
    let hourlyRate: Double
    let hours: Double
    let extra: Double?
    let extraDescription: String?
    
    var total: String {
        let total = hourlyRate * hours + (extra ?? 0.0)
        return String(format: "%.2f", total)
    }
    
}

let myShifts: [Shift] = [
    Shift(date: "1/2/2021", store: "Rowlands 2468", hourlyRate: 25, hours: 9.5, extra: 5.0, extraDescription: "Parking"),
    Shift(date: "3/2/2021", store: "Independent101", hourlyRate: 23, hours: 9.0, extra: 10.00, extraDescription: "Petrol"),
    Shift(date: "4/2/2021", store: "Boots123", hourlyRate: 28, hours: 9.0, extra: nil, extraDescription: nil),
    Shift(date: "8/2/2021", store: "DayLewis987", hourlyRate: 24, hours: 8.0, extra: 5, extraDescription: "Parking"),
    Shift(date: "9/2/2021", store: "Kamsons101", hourlyRate: 25, hours: 9.0, extra: 10.00, extraDescription: "MURs")
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach (myShifts) { shift in
                    HStack (alignment: .firstTextBaseline) {
                        VStack (alignment: .leading){
                            Text("\(shift.store)")
                                .fontWeight(.bold)
                            Text("\(shift.date)")
                        }
                        
                        Spacer()
                        
                        Text("£ \(shift.total)")
                        
                    }
                }
            }
            .navigationTitle("iShift")
            .navigationBarItems(trailing: Image(systemName: "plus").font(.system(size: 18, weight: .bold)))
                                    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark
            )
    }
}
