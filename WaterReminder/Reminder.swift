//
//  Reminder.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/8/24.
//
import Foundation

struct Reminder: Codable, Identifiable {
    var id = UUID()
    var time: Date
    var isActive: Bool = true
}
