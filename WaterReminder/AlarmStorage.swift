//
//  AlarmStorage.swift
//  WaterReminder
//
//  Created by Stacey Smith on 4/18/24.
//

import Foundation

class AlarmStorage {
    static let shared = AlarmStorage()
    
    private let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("alarms.json")

    func saveAlarms(_ reminders: [Reminder]) {
        do {
            let data = try JSONEncoder().encode(reminders)
            try data.write(to: filePath, options: .atomicWrite)
        } catch {
            print("Error saving alarms: \(error)")
        }
    }
    
    func loadAlarms() -> [Reminder] {
        do {
            let data = try Data(contentsOf: filePath)
            return try JSONDecoder().decode([Reminder].self, from: data)
        } catch {
            print("Error loading alarms: \(error)")
            return []
        }
    }
}