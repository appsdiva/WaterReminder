//
//  ReminderView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 4/18/24.
//

import SwiftUI

struct ReminderView: View {
    @Binding var reminder: Reminder
    private var notificationManager = NotificationManager.shared
    
    // Explicit public initializer
        public init(reminder: Binding<Reminder>) {
            _reminder = reminder
        }

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
                    notificationManager.scheduleNotification(for: reminder)
                } else {
                    notificationManager.cancelNotification(for: reminder)
                }
            }
            .toggleStyle(SwitchToggleStyle(tint: .blue))
            .padding(.trailing)
        }
        .padding(35)
    }
    
   
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView(reminder: .constant(Reminder(time: Date(), isActive: true)))
    }
}


