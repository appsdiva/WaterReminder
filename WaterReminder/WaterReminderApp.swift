//
//  WaterReminderApp.swift
//  WaterReminder
//
//  Created by Stacey Smith on 3/20/24.
//

import SwiftUI
import UserNotifications

@main
struct WaterReminderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// AppDelegate to handle UIApplicationDelegate responsibilities,
// such as requesting notification permissions.
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Asynchronously request notification permissions
        DispatchQueue.main.async {
            self.requestNotificationPermissions()
        }
        return true
    }
    
    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notifications permission granted.")
            } else if let error = error {
                print("Notifications permission denied because: \(error.localizedDescription)")
            }
        }
    }
}
