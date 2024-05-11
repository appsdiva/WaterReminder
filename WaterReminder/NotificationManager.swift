//
//  NotificationManager.swift
//  WaterReminder
//
//  Created by Stacey Smith on 4/18/24.
//

import UserNotifications
import AudioToolbox

class NotificationManager {
    
    static let shared = NotificationManager() // Singleton instance if needed.
    
    
    var reminders: [Reminder] = []
    
    private init() {} // Private initializer to ensure singleton usage.
    
    func addReminder(_ reminder: Reminder) {
            reminders.append(reminder)
            // Add any additional logic to manage reminders here
            // such as registering the reminder with iOS notifications
        }
    
    
    func vibratePhone() {
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    
    func scheduleNotification(for reminder: Reminder) {
            // Implement the notification scheduling logic here.
            let content = UNMutableNotificationContent()
            content.title = "Time to Drink Water"
            content.body = "Stay hydrated! It's time to drink some water."
            content.sound = UNNotificationSound.default
        
        // Schedule notification for each active day
        for (index, shouldRepeat) in reminder.repeatDays.enumerated() {
            if shouldRepeat {
                scheduleWeeklyNotification(for: reminder, dayOfWeek: index + 1, content: content)
            }
        }
    
        let targetDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminder.time)
            let trigger = UNCalendarNotificationTrigger(dateMatching: targetDate, repeats: false)
    
        let request = UNNotificationRequest(identifier: reminder.id.uuidString, content: content, trigger: trigger)
    
            UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error)")
                    } else {
                        print("Notification scheduled!")
                        //self.vibratePhone() // Optionally ensure vibration at the point of scheduling
                    }
                }
        }
    
    func cancelNotification(for reminder: Reminder) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [reminder.id.uuidString])
    }
}

    private func scheduleWeeklyNotification(for reminder: Reminder, dayOfWeek: Int, content: UNMutableNotificationContent) {
            var dateComponents = Calendar.current.dateComponents([.hour, .minute], from: reminder.time)
            dateComponents.weekday = dayOfWeek  // Sunday = 1 through Saturday = 7

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                }
            }
        }

//func requestAuthorization() {
//    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
//        if granted {
//            print("Notification permission granted.")
//        } else if let error = error {
//            print("Notification permission denied because: \(error.localizedDescription).")
//        }
//    }
//}
