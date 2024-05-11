//
//  ContentView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTime = Date()
    //@StateObject var alarmManager = AlarmManager.shared
    @ObservedObject var alarmManager = AlarmManager.shared  // Use shared instance of AlarmManager
    @State private var showingAddAlarm = false
    @State private var repeatDays = Array(repeating: false, count: 7)
    let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
    //    @State private var selectedTime = Date()
    //    @State private var reminders: [Reminder] = []
    //    @State private var showingAddReminder = false
    //    @State private var repeatDays = Array(repeating: false, count: 7)
    //        let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
    
    
//    init() {
//        _alarms = State(initialValue: AlarmStorage.shared.loadAlarms())
//    }
    
   
    
    
    let moonGray = Color(white: 0.9, opacity: 0.6)
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .bottomTrailing, endPoint: .topLeading)
    let gradient2 = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .top, endPoint: .bottom)
    let alarmblack = LinearGradient(gradient: Gradient(colors: [Color.blue, Color("darkblue")]), startPoint: .top, endPoint: .bottom)
    
    let coral = Color(red: 255/255, green: 127/255, blue: 80/255)
    let offWhite = Color(red: 245/255, green: 245/255, blue: 245/255)
    let darkGray = Color(red: 40/255, green: 40/255, blue: 40/255)
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color(red: 0.53, green: 0.81, blue: 0.92)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        
                        // Clock at the top
                        ClockView()  // Ensure ClockView is correctly defined to show the current time
                        Text("WATER REMINDERS")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        // Alarms list
                        ScrollView {
                            VStack {
                                ForEach(alarmManager.alarms) { alarm in
                                    SwipeToDeleteView(alarm: alarm, onDelete: {
                                        if let index = alarmManager.alarms.firstIndex(where: { $0.id == alarm.id }) {
                                            withAnimation {
                                                alarmManager.alarms.remove(at: index)
                                            }
                                        }
                                    })
                                }
                            }
                            .padding()
                        }


                       
                        Spacer()
                        
                        Button(action: {
                            showingAddAlarm.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 55))
                                .foregroundColor(.white)
                                .shadow(radius: 20)
                        }
                        .padding(.bottom)
                        .sheet(isPresented: $showingAddAlarm) {
                            // Provide a view or form here to input new alarm details
                            AddAlarmView(alarmManager: alarmManager)
                        }
                    }
                }
                //.navigationTitle("Water Reminders")
                .navigationBarItems(trailing: Button(action: {
                                // Action for the ellipsis button
                            }) {
                                VerticalEllipsisIcon()
                            })
            }
        }
    //
    //    var body: some View {
    //        NavigationView {
    //            VStack(spacing: 20) {
    //                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
    //                    .datePickerStyle(WheelDatePickerStyle())
    //                    .background(.white.opacity(0.9))
    //                    .cornerRadius(55)
    //                    .padding(.horizontal, 20)
    //                    .foregroundColor(.black)
    //                    //.font(.title3)
    //                    .clipShape(Circle())
    //                    .shadow(radius: 30)
    //                HStack {
    //                                    ForEach(0..<daysOfWeek.count, id: \.self) { index in
    //                                        Button(action: {
    //                                            repeatDays[index].toggle()
    //                                        }) {
    //                                            Text(daysOfWeek[index])
    //                                                .fontWeight(repeatDays[index] ? .bold : .regular)
    //                                                .foregroundColor(repeatDays[index] ? .white : .black)
    //                                                .padding(10)
    //                                                .background(repeatDays[index] ? Color.blue : Color.gray.opacity(0.5))
    //                                                .cornerRadius(20)
    //                                        }
    //                                    }
    //                                }
    //                
    //                Button("Add Reminder") {
    //                    addReminder()
    //                }
    //                .padding()
    //                .background(.black)
    //                .fontWeight(.bold)
    //                .foregroundColor(.white)
    //                .cornerRadius(15)
    //                .padding(.horizontal)
    //                
    //                ScrollView {
    //                    VStack(spacing: 15) {
    //                        ForEach($reminders) { $reminder in
    //                            ReminderView(reminder: $reminder)
    //                                .cornerRadius(20)
    //                                .shadow(radius: 10)
    //                                .padding(.horizontal, 30)
    //                        }
    //                    }
    //                }
    //            }
    //            .navigationTitle("Drink Water")
    //            .navigationBarTitleDisplayMode(.large)
    //            //.background(gradient.edgesIgnoringSafeArea(.all))
    //            
    //        }
    //    }
    
    func createAndAddAlarm() {
        let selectedDate = Date() // Example: Get date from a date picker or current date/time
        let isAM = Calendar.current.component(.hour, from: selectedDate) < 12
        let newAlarm = Alarm(time: selectedDate, isAM: isAM, isActive: true, repeatDays: [false, true, false, true, false, true, false])
        alarmManager.addAlarm(newAlarm)
    }
}

//    private func addReminder() {
//        withAnimation {
//            let newReminder = Reminder(time: selectedTime, isActive: true)
//            reminders.append(newReminder)
//            // Assuming NotificationManager can schedule notifications
//            NotificationManager.shared.scheduleNotification(for: newReminder)
//            AlarmStorage.shared.saveAlarms(reminders)
//        }
//    }
//}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//                                ForEach(alarmManager.alarms) { alarm in
//                                    HStack {
//                                        AlarmRow(alarm: alarm)
//
//                                        Button(action: {
//                                            if let index = alarmManager.alarms.firstIndex(where: { $0.id == alarm.id }) {
//                                                alarmManager.alarms.remove(at: index)
//                                            }
//                                        }) {
//                                            Image(systemName: "trash")
//                                                .foregroundColor(.red)
//                                        }
//                                    }
//                                    .padding(.horizontal)
//                                    //.background(Color.white) // You can set any color or keep it transparent
//                                    .cornerRadius(10)
//                                    .shadow(radius: 2) // Optional for better UI
//                                }
