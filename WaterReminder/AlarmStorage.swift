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
    
    func saveAlarms(_ alarms: [Alarm]) {
        do {
            let data = try JSONEncoder().encode(alarms)
            try data.write(to: filePath, options: .atomicWrite)
        } catch {
            print("Error saving alarms: \(error)")
        }
    }
    
    func loadAlarms() -> [Alarm] {
        if FileManager.default.fileExists(atPath: filePath.path) {
            do {
                let data = try Data(contentsOf: filePath)
                return try JSONDecoder().decode([Alarm].self, from: data)
            } catch {
                print("Error loading alarms: \(error)")
                return []
            }
        } else {
            print("No existing file found. Returning empty list.")
            return [] // Return an empty list if the file does not exist.
        }
    }
}
    

