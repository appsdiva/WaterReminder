//
//  ContentView.swift
//  WaterReminder
//
//  Created by Stacey Smith on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTime = Date()
    @State private var reminders: [Date] = []
    
    let moonGray = Color(white: 0.9, opacity: 0.5)
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .bottomLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select Reminder Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding(20)
                
                Button("Add Reminder") {
                    addReminder()
                }
                .padding()
                .background(gradient)
                .foregroundColor(.white)
                .cornerRadius(15)
                
                List {
                    ForEach(reminders, id: \.self) { reminder in
                        Text("\(reminder, formatter: itemFormatter)")
                            .listRowBackground(gradient)
                            
                    }
                    .onDelete(perform: deleteReminder)
                    
                    
                }
                
                //.cornerRadius(40)
                
                
            }
            .background(moonGray)
            .cornerRadius(40)
            .padding()
            .navigationTitle("Drink Water Reminders")
            .background(gradient)
//            .toolbar {
//                EditButton()
//            }
        }
        .backgroundStyle(Color.purple)
    }
        
        
    
    private func addReminder() {
        withAnimation {
            reminders.append(selectedTime)
            scheduleNotification(for: selectedTime)
        }
        
    }
    
    private func deleteReminder(at offsets: IndexSet) {
        withAnimation {
            offsets.forEach { index in
                // Here, you could also cancel the notification if you keep a reference to it.
                reminders.remove(at: index)
            }
        }
    }
    
    func scheduleNotification(for time: Date) {
        // Implement the notification scheduling logic here.
        let content = UNMutableNotificationContent()
        content.title = "Time to Drink Water"
        content.body = "Stay hydrated! It's time to drink some water."
        content.sound = UNNotificationSound.default
        
        let targetDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: targetDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

// Helper to format the date displayed in the list.
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    return formatter
}()


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
