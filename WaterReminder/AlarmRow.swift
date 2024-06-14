//
//  AlarmRow.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import SwiftUI

struct AlarmRow: View {
    var alarm: Alarm
    
    var body: some View {
        HStack {
            Text(alarm.time, style: .time) // Adjusted to use the time directly
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(alarm.isActive ? .white : .white.opacity(0.7))
            Spacer()
            Text(alarm.isAM ? "AM" : "PM")
                .foregroundColor(.white)
                .opacity(0.7)
            Toggle("", isOn: Binding(
                get: { alarm.isActive },
                set: { newValue in
                    // Assuming you have a way to modify the alarm's active state in your AlarmManager
                    let index = AlarmManager.shared.alarms.firstIndex(where: { $0.id == alarm.id })!
                    AlarmManager.shared.alarms[index].isActive = newValue
                }
            ))
            .toggleStyle(SwitchToggleStyle(tint: .white.opacity(0.6)))
        }
        .padding(.horizontal)
    }
}


//#Preview {
//    AlarmRow(alarm: )
//}
