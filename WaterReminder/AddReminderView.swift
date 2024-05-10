//
//  addReminderView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import SwiftUI

struct AddReminderView: View {
    @Binding var selectedTime: Date
    @Binding var repeatDays: [Bool]
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var onAdd: () -> Void

    var body: some View {
        VStack {
            DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            HStack {
                ForEach(0..<daysOfWeek.count, id: \.self) { index in
                    Button(action: {
                        repeatDays[index].toggle()
                    }) {
                        Text(daysOfWeek[index])
                            .fontWeight(repeatDays[index] ? .bold : .regular)
                            .foregroundColor(repeatDays[index] ? .white : .black)
                            .padding(10)
                            .background(repeatDays[index] ? Color.blue : Color.gray.opacity(0.5))
                            .cornerRadius(20)
                    }
                }
            }
            .padding()

            Button("Add", action: onAdd)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    @State static var previewSelectedTime = Date()  // Use static for PreviewProvider
    @State static var previewRepeatDays = Array(repeating: false, count: 7)

    static var previews: some View {
        // Convert State to Binding
        AddReminderView(selectedTime: .constant(previewSelectedTime),
                        repeatDays: .constant(previewRepeatDays),
                        onAdd: {
                            // Implement what should happen when 'Add' is tapped, if needed for preview
                            print("Add tapped")
                        })
    }
}

//#Preview {
//    addReminderView()
//}
