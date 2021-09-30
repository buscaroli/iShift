//
//  AddShiftView.swift
//  iShift
//
//  Created by Matteo on 30/09/2021.
//

import SwiftUI

struct AddShiftView: View {
    @ObservedObject var expenses: ShiftsList
    @Environment (\.presentationMode) var presentationMode
    
    @State var store = ""
    @State var date = ""
    @State var hourlyRate = ""
    @State var hours = ""
    @State var extra = ""
    @State var extraDescription = ""
    
    var body: some View {
        VStack {
            Form {
                TextField("Location", text: $store)
                TextField("Date", text: $date)
                TextField("Hourly Rate", text: $hourlyRate)
                TextField("Hours", text: $hours)
                TextField("Extra", text: $extra)
                TextField("Description", text: $extraDescription)
                
            }
            
            HStack {
                Button(action: {
                    let hourlyRateD = Double(hourlyRate) ?? 0.0
                    let hoursD = Double(hours) ?? 0.0
                    let extraD = Double(extra) ?? 0.0
                    
                    let shift = Shift(date: date, store: store, hourlyRate: hourlyRateD , hours: hoursD, extra: extraD, extraDescription: extraDescription)
                    self.expenses.shifts.append(shift)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .padding()
                        .foregroundColor(.green)
                        
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .padding()
                        .foregroundColor(.red)
                        
                }
            }
        }
    }
}

struct AddShiftView_Previews: PreviewProvider {
    static var previews: some View {
        AddShiftView(expenses: ShiftsList())
    }
}
