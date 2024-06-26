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
        NavigationView {
            Form {
                DatePicker(" ", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                Section(header: Text("Repeat")) {
                    ForEach(0..<daysOfWeek.count, id: \.self) { index in
                        Toggle(daysOfWeek[index], isOn: $repeatDays[index])
                            .toggleStyle(CustomToggleStyle())
                    }
                    .foregroundColor(Color("middleblue"))
                }
            }
            .navigationBarTitle("Add New Alarm", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }.customFont(size: 25),
                trailing: Button("Save") {
                saveAlarm()
                presentationMode.wrappedValue.dismiss()
            }.customFont(size: 25)
            )
        }
        //.foregroundColor(Color("middleblue"))
        .font(.title3)
        .fontWeight(.medium)
    }
    
    private func saveAlarm() {
        let isAM = Calendar.current.component(.hour, from: selectedTime) < 12
        let newAlarm = Alarm(time: selectedTime, isAM: isAM, isActive: true, repeatDays: repeatDays)
        alarmManager.addAlarm(newAlarm)
    }
    
    }

struct CustomFont: ViewModifier {
    var size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: .bold, design: .default))
            .foregroundColor(Color("middleblue"))
    }
}

extension View {
    func customFont(size: CGFloat) -> some View {
        self.modifier(CustomFont(size: size))
    }
}

//struct AddAlarmView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Creating a mock instance for preview purposes
//        AddAlarmView(alarmManager: AlarmManager())
//    }
//}

//#Preview {
//    AddAlarmView(alarmManager: AlarmManager())
//}
