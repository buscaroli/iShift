//
//  ShiftsList.swift
//  iShift
//
//  Created by Matteo on 30/09/2021.
//

import Foundation

class ShiftsList: ObservableObject {
    @Published var shifts = [Shift]()
}
