//
//  AddAlarmView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import SwiftUI

struct AddAlarmView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var alarmManager: AlarmManager
    @State private var selectedTime = Date()
    @State private var repeatDays = Array(repeating: false, count: 7)
    let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]

    var body: some View {
        NavigationView {
            Form {
                DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                
                Section(header: Text("Repeat")) {
                    ForEach(0..<daysOfWeek.count, id: \.self) { index in
                        Toggle(daysOfWeek[index], isOn: $repeatDays[index])
                    }
                }
            }
            .navigationBarTitle("Add New Alarm", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                saveAlarm()
                presentationMode.wrappedValue.dismiss()
            })
        }
    }

    private func saveAlarm() {
        let isAM = Calendar.current.component(.hour, from: selectedTime) < 12
        let newAlarm = Alarm(time: selectedTime, isAM: isAM, isActive: true, repeatDays: repeatDays)
        alarmManager.addAlarm(newAlarm)
    }
}

struct AddAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        // Creating a mock instance for preview purposes
        AddAlarmView(alarmManager: AlarmManager())
    }
}

//#Preview {
//    AddAlarmView()
//}
