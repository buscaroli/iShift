//
//  ContentView.swift
//  iShift
//
//  Created by Matteo on 30/09/2021.
//

import SwiftUI

//let myShifts: [Shift] = [
//    Shift(date: "1/2/2021", store: "Rowlands 2468", hourlyRate: 25, hours: 9.5, extra: 5.0, extraDescription: "Parking"),
//    Shift(date: "3/2/2021", store: "Independent101", hourlyRate: 23, hours: 9.0, extra: 10.00, extraDescription: "Petrol"),
//    Shift(date: "4/2/2021", store: "Boots123", hourlyRate: 28, hours: 9.0, extra: nil, extraDescription: nil),
//    Shift(date: "8/2/2021", store: "DayLewis987", hourlyRate: 24, hours: 8.0, extra: 5, extraDescription: "Parking"),
//    Shift(date: "9/2/2021", store: "Kamsons101", hourlyRate: 25, hours: 9.0, extra: 10.00, extraDescription: "MURs")
//]


struct ContentView: View {
    @ObservedObject var expenses = ShiftsList()
    @State private var showingAddShift = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            List {
                ForEach (expenses.shifts) { shift in
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
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iShift")
            .navigationBarItems(trailing:
                                    Button(action: {
                self.showingAddShift = true
                
            }) {
                Text(Image(systemName: "plus"))
            })
            .sheet(isPresented: $showingAddShift) {
                AddShiftView(expenses: self.expenses)
                    .preferredColorScheme(colorScheme)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.shifts.remove(atOffsets: offsets)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
