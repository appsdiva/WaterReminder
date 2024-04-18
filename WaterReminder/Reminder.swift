//
//  Reminder.swift
//  WaterReminder
//
//  Created by Stacey Smith on 4/18/24.
//

import Foundation

struct Reminder: Identifiable, Equatable {
    let id = UUID()
    var time: Date
    var isActive: Bool = true
}
