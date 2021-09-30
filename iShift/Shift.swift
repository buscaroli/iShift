//
//  Shift.swift
//  iShift
//
//  Created by Matteo on 30/09/2021.
//

import Foundation

struct Shift: Identifiable {
    let id = UUID()
    let date: String
    let store: String
    let hourlyRate: Double
    let hours: Double
    let extra: Double?
    let extraDescription: String
    
    var total: String {
        let total = hourlyRate * hours + (extra ?? 0.0)
        return String(format: "%.2f", total)
    }
    
}


