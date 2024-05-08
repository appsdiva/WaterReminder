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
    @State private var repeatDays = Array(repeating: false, count: 7)
        let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    
    init() {
            _reminders = State(initialValue: AlarmStorage.shared.loadAlarms())
        }


    let moonGray = Color(white: 0.9, opacity: 0.6)
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .bottomTrailing, endPoint: .topLeading)
    let gradient2 = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .top, endPoint: .bottom)
    let alarmblack = LinearGradient(gradient: Gradient(colors: [Color.blue, Color("darkblue")]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .background(.white.opacity(0.9))
                    .cornerRadius(55)
                    .padding(.horizontal, 20)
                    .foregroundColor(.black)
                    //.font(.title3)
                    .clipShape(Circle())
                    .shadow(radius: 30)
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
                    VStack(spacing: 15) {
                        ForEach($reminders) { $reminder in
                            ReminderView(reminder: $reminder)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .padding(.horizontal, 40)
                        }
                    }
                }
            }
            .navigationTitle("Drink Water")
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
            AlarmStorage.shared.saveAlarms(reminders)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


