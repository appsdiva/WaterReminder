//
//  ContentView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var alarmManager = AlarmManager.shared  // Use shared instance of AlarmManager
    @State private var selectedTime = Date()
    @State private var alarms: [Alarm] = []
    @State private var showingAddAlarm = false
    @State private var repeatDays = Array(repeating: false, count: 7)
    let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
  
    init() {
        _alarms = State(initialValue: AlarmStorage.shared.loadAlarms())
    }
    
    let moonGray = Color(white: 0.9, opacity: 0.6)
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .bottomTrailing, endPoint: .topLeading)
    let gradient2 = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .top, endPoint: .bottom)
    let alarmblack = LinearGradient(gradient: Gradient(colors: [Color.blue, Color("darkblue")]), startPoint: .top, endPoint: .bottom)
    let darkGray = Color(red: 40/255, green: 40/255, blue: 40/255)
    
    var body: some View {
            NavigationView {
                ZStack {
                    //Color(red: 0.53, green: 0.81, blue: 0.92)
                    //.backgroundColor(gradient)
                        gradient.edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        
                        // Clock at the top
                        ClockView()
                        
                        Text("DRINK WATER")
                            .foregroundStyle(.white)
                            .font(.system(size: 25, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                         //Alarms list
                        ScrollView {
                                    VStack {
                                        ForEach(alarmManager.alarms) { alarm in
                                            SwipeToDeleteView(alarmManager: alarmManager, alarm: alarm, onDelete: {
                                                deleteAlarm(alarm: alarm)
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
                                .font(.system(size: 58))
                                .foregroundColor(.white)
                                .shadow(radius: 4)
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
    
    private func createAndAddAlarm() {
        let selectedDate = Date() // Example: Get date from a date picker or current date/time
        let isAM = Calendar.current.component(.hour, from: selectedDate) < 12
        let newAlarm = Alarm(time: selectedDate, isAM: isAM, isActive: true, repeatDays: [false, true, false, true, false, true, false])
        alarmManager.addAlarm(newAlarm)
        
        AlarmManager.shared.scheduleNotification(for: newAlarm)
        AlarmStorage.shared.saveAlarms(alarmManager.alarms)
       
    }
    
    private func deleteAlarm(alarm: Alarm) {
            withAnimation {
                if let index = alarmManager.alarms.firstIndex(where: { $0.id == alarm.id }) {
                    alarmManager.alarms.remove(at: index)
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


