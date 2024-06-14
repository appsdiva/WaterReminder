//
//  ContentView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var alarmManager = AlarmManager.shared // Use shared instance of AlarmManager
    @ObservedObject var storeManager = StoreManager()
    @State private var showingAddAlarm = false
    @State private var showSettings = false
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("darkblue"), Color("lightblue")]), startPoint: .bottomTrailing, endPoint: .topLeading)
    
    var body: some View {
        NavigationView {
            ZStack {
                gradient.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    ClockView()
                    Text("DRINK WATER")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
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
                        AddAlarmView(alarmManager: alarmManager)
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.showSettings.toggle()
            }) {
                VerticalEllipsisIcon()
            })
            .popover(isPresented: $showSettings, arrowEdge: .top) {
                SettingsView(storeManager: storeManager)
            }
        }
    }
    
    private func deleteAlarm(alarm: Alarm) {
        withAnimation {
            alarmManager.removeAlarm(alarm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


