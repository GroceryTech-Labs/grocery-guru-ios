//
//  Item.swift
//  Grocery Guru
//
//  Created by Max Maetze on 23.05.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
