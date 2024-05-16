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
    let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    var body: some View {
        ZStack {
            // Setting the background for the entire view
            Color(red: 0.53, green: 0.81, blue: 0.92)
                .edgesIgnoringSafeArea(.all)  // Make sure it covers the entire screen

            NavigationView {
                Form {
                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                    
                    Section(header: Text("Repeat")) {
                        ForEach(0..<daysOfWeek.count, id: \.self) { index in
                            Toggle(daysOfWeek[index], isOn: $repeatDays[index])
                        }
                        .foregroundColor(.black)
                    }
                }
                .background(Color(red: 0.53, green: 0.81, blue: 0.92))
                .scrollContentBackground(.hidden)
                .navigationBarTitle("Add New Alarm", displayMode: .inline)
                .navigationBarItems(leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }, trailing: Button("Save") {
                    saveAlarm()
                    presentationMode.wrappedValue.dismiss()
                })
            }
            .foregroundColor(.white)
            .font(.title3)
            .fontWeight(.medium)
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
