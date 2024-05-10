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
    @State private var showingAddReminder = false
    @State private var repeatDays = Array(repeating: false, count: 7)
        let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]

    
    init() {
            _reminders = State(initialValue: AlarmStorage.shared.loadAlarms())
        }


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
                   //Color(red: 1, green: 0.40, blue: 0.33) // Set the background color
                       .edgesIgnoringSafeArea(.all)
                   
                   VStack {
                       Spacer()
                       
                       // Clock at the top
                       ClockView() // You'll define this view next
                       
                       // Alarms list
                       VStack(spacing: 20) {
                           Text("REMINDERS")
                           AlarmRow(time: "06:56", isAM: true, isActive: true)
                           AlarmRow(time: "05:45", isAM: true, isActive: false)
                           AlarmRow(time: "10:24", isAM: false, isActive: true)
                       }
                       .padding()
                       
                       Spacer()
                       
                       Button(action: {}) {
                           Image(systemName: "plus.circle.fill")
                               .font(.system(size: 55))
                               .foregroundColor(.white)
                               .shadow(radius: 20)
                       }
                       .padding(.bottom)
                   }
               }
// .navigationBarTitle("Alarms", displayMode: .inline)
                   .navigationBarItems(trailing: Button(action: {
                       // Action for the button
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


