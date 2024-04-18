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
    
    let alarmcolor = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .bottom, endPoint: .top)

    var body: some View {
        HStack {
            Text("\(reminder.time, formatter: DateFormatter.itemFormatter)")
                .font(.system(size: 40, weight: .bold, design: .default))
                .foregroundColor(.white)
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
            .toggleStyle(SwitchToggleStyle(tint: .black))
            .padding(.trailing)
        }
        .padding(30)
        .background(alarmcolor.opacity(0.7))
    }
    
   
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView(reminder: .constant(Reminder(time: Date(), isActive: true)))
    }
}


