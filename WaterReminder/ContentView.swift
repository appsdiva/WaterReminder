//
//  ContentView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTime = Date()
    @State private var reminders: [Reminder] = []
    
    private var notificationManager = NotificationManager.shared

    let moonGray = Color(white: 0.9, opacity: 0.6)
    let lightGray = Color(white: 0.95, opacity: 1)
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack {
            DatePicker("Select Reminder Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()
                .background(gradient)
                .cornerRadius(15)
                .padding(.horizontal)
                .foregroundColor(.white)
            
            Button("Add Reminder") {
                addReminder()
            }
            .padding()
            .background(gradient)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach($reminders) { $reminder in
                        ReminderView(reminder: $reminder)
                            .background(lightGray)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .background(moonGray.ignoresSafeArea())
        .navigationTitle("Water Reminders")
    }
    
    func addReminder() {
            let newReminder = Reminder(time: selectedTime, isActive: true)
            reminders.append(newReminder)
            notificationManager.addReminder(newReminder)
        }
}

//withAnimation {
//    NotificationManager.shared.addReminder(reminder: newReminder, to: &reminders)
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


