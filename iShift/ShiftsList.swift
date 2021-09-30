//
//  ShiftsList.swift
//  iShift
//
//  Created by Matteo on 30/09/2021.
//

import Foundation

class ShiftsList: ObservableObject {
    @Published var shifts = [Shift]() {
//        property observer: everytime this property is modified, the following code is executed
        didSet {
            if let encodedData = try? JSONEncoder().encode(shifts) {
                UserDefaults.standard.set(encodedData, forKey: "Shifts")
            }
        }
    }
    
    init() {
        if let savedShifts = UserDefaults.standard.data(forKey: "Shifts") {
            if let decodedData = try? JSONDecoder().decode([Shift].self, from: savedShifts) {
                self.shifts = decodedData
                return
            }
        }
        self.shifts = []
    }
}
