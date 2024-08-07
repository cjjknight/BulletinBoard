//
//  Item.swift
//  BulletinBoard
//
//  Created by Christopher Johnson on 7/30/24.
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
