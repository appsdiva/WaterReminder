//
//  AlarmManager.swift
//  WaterReminder
//
//  Created by Stacey Smith on 5/10/24.
//

import UserNotifications
import AudioToolbox
import Combine

class AlarmManager: ObservableObject  {

    @Published var alarms: [Alarm] = []
    static let shared = AlarmManager() // Singleton instance if needed.

    //var alarms: [Alarm] = []

    //private init() {} // Private initializer to ensure singleton usage.
    public init() {}

    func addAlarm(_ alarm: Alarm) {
        alarms.append(alarm)
//        DispatchQueue.main.async {
//               self.alarms.append(alarm)
//           }
        // Add any additional logic to manage alarms here
        // such as registering the alarm with iOS notifications
    }
    
    func removeAlarm(at index: Int) {
            //alarms.remove(at: index)
        DispatchQueue.main.async {
                   self.alarms.remove(at: index)
               }
        }

        func toggleIsActive(for alarmId: UUID) {
            if let index = alarms.firstIndex(where: { $0.id == alarmId }) {
                alarms[index].isActive.toggle()
            }
        }

    func vibratePhone() {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }

    func scheduleNotification(for alarm: Alarm) {
        // Implement the notification scheduling logic here.
        let content = UNMutableNotificationContent()
        content.title = "Alarm Notification"
        content.body = "Your scheduled alarm is ringing now!"
        content.sound = UNNotificationSound.default
    
        // Schedule notification for each active day
        for (index, shouldRepeat) in alarm.repeatDays.enumerated() {
            if shouldRepeat {
                scheduleWeeklyNotification(for: alarm, dayOfWeek: index + 1, content: content)
            }
        }

        let targetDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: alarm.time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: targetDate, repeats: false)

        let request = UNNotificationRequest(identifier: alarm.id.uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled!")
                //self.vibratePhone() // Optionally ensure vibration at the point of scheduling
            }
        }
    }

    func cancelNotification(for alarm: Alarm) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm.id.uuidString])
    }
}

private func scheduleWeeklyNotification(for alarm: Alarm, dayOfWeek: Int, content: UNMutableNotificationContent) {
    var dateComponents = Calendar.current.dateComponents([.hour, .minute], from: alarm.time)
    dateComponents.weekday = dayOfWeek  // Sunday = 1 through Saturday = 7

    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error)")
        }
    }
}

func requestAuthorization() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        if granted {
            print("Notification permission granted.")
        } else if let error = error {
            print("Notification permission denied because: \(error.localizedDescription).")
        }
    }
}
