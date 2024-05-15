//
//  Alarm.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import Foundation

struct Alarm: Identifiable, Codable {
    //var id = UUID()
    var id: UUID = UUID()
    var time: Date
    var isAM: Bool
    var isActive: Bool
    var repeatDays: [Bool] = Array(repeating: false, count: 7)  // Sunday to Saturday
}

