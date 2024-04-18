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

    let moonGray = Color(white: 0.9, opacity: 0.6)
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .bottomTrailing, endPoint: .topLeading)
    let gradient2 = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .top, endPoint: .bottom)
    let alarmblack = LinearGradient(gradient: Gradient(colors: [Color.blue, Color("darkblue")]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .background(gradient2)
                    .cornerRadius(55)
                    .padding(.horizontal, 20)
                    .foregroundColor(.black)
                    .font(.title3)
                
                Button("Add Reminder") {
                    addReminder()
                }
                .padding()
                .background(.black)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach($reminders) { $reminder in
                            ReminderView(reminder: $reminder)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Water Reminders")
            .navigationBarTitleDisplayMode(.large)
            .background(gradient.edgesIgnoringSafeArea(.all))
        }
    }

    private func addReminder() {
        withAnimation {
            let newReminder = Reminder(time: selectedTime, isActive: true)
            reminders.append(newReminder)
            // Assuming NotificationManager can schedule notifications
            NotificationManager.shared.scheduleNotification(for: newReminder)
        }
    }
}


//func addReminder() {
//        let newReminder = Reminder(time: selectedTime, isActive: true)
//        reminders.append(newReminder)
//        notificationManager.addReminder(newReminder)
//    }

//withAnimation {
//    NotificationManager.shared.addReminder(reminder: newReminder, to: &reminders)
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


