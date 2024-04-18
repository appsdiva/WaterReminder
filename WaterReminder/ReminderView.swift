//
//  ReminderView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 4/18/24.
//

import SwiftUI

struct ReminderView: View {
    @Binding var reminder: Reminder

    var body: some View {
        HStack {
            Text("\(reminder.time, formatter: DateFormatter.itemFormatter)")
                .font(.headline)
                .padding(.leading)
            
            Spacer()
            
            Toggle(isOn: $reminder.isActive) {
                Text(reminder.isActive ? "On" : "Off")
            }
            .labelsHidden()
            .onChange(of: reminder.isActive) { newValue in
                if newValue {
                    scheduleNotification(for: reminder)
                } else {
                    cancelNotification(for: reminder)
                }
            }
            .toggleStyle(SwitchToggleStyle(tint: .blue))
            .padding(.trailing)
        }
        .padding()
    }
    
    private func scheduleNotification(for reminder: Reminder) {
        // The existing scheduling logic from ContentView goes here.
    }
    
    private func cancelNotification(for reminder: Reminder) {
        // The existing cancel logic from ContentView goes here.
    }
}

