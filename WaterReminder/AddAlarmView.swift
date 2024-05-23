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
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .bottomTrailing, endPoint: .topLeading)
    let gradient2 = LinearGradient(gradient: Gradient(colors: [Color("middleblue"), Color("darkblue")]), startPoint: .top, endPoint: .bottom)

    var body: some View {
            NavigationView {
                Form {
                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                    
                    Section(header: Text("Repeat")) {
                        ForEach(0..<daysOfWeek.count, id: \.self) { index in
                            Toggle(daysOfWeek[index], isOn: $repeatDays[index])
                                .toggleStyle(CustomToggleStyle())
//                                .toggleStyle(ColoredToggleStyle(onColor: Color("darkblue"), offColor: .gray, thumbColor: .white))
                        }
                        .foregroundColor(.black)
                    }
                }
                //.background(gradient)
                .scrollContentBackground(.hidden)
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
            .foregroundColor(Color("middleblue"))
            .font(.title3)
            .fontWeight(.medium)
        }

    private func saveAlarm() {
            let isAM = Calendar.current.component(.hour, from: selectedTime) < 12
            let newAlarm = Alarm(time: selectedTime, isAM: isAM, isActive: true, repeatDays: repeatDays) // Use repeatDays directly

            // Use repeatDays directly to access the actual Boolean array
            for (index, shouldRepeat) in repeatDays.enumerated() {
                if shouldRepeat {
                    let dayOfWeek = index + 1 // Adjust based on how your days of the week are indexed
                    alarmManager.scheduleWeeklyNotification(for: newAlarm, dayOfWeek: dayOfWeek, content: createNotificationContent()) // Access the method directly
                }
            }
        }
    
//    private func saveAlarm() {
//        let isAM = Calendar.current.component(.hour, from: selectedTime) < 12
//        let newAlarm = Alarm(time: selectedTime, isAM: isAM, isActive: true, repeatDays: repeatDays)
//
//        // You can directly iterate over repeatDays since it's a local @State array
//        for (index, shouldRepeat) in repeatDays.enumerated() {
//            if shouldRepeat {
//                let dayOfWeek = index + 1  // Ensure this maps correctly to your days representation
//                alarmManager.scheduleWeeklyNotification(for: newAlarm, dayOfWeek: dayOfWeek, content: createNotificationContent())
//            }
//        }
//    }

}

func createNotificationContent() -> UNMutableNotificationContent {
    let content = UNMutableNotificationContent()
    content.title = "Time to Drink Water"
    content.body = "Stay hydrated! It's time to drink some water."
    content.sound = UNNotificationSound.default
    return content
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
//    AddAlarmView()
//}
