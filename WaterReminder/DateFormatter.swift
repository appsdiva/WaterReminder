//
//  DateFormatter.swift
//  WaterReminder
//
//  Created by Stacey Smith on 4/18/24.
//

import Foundation

extension DateFormatter {
    static let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
}

