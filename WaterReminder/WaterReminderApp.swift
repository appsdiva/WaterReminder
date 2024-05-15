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
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Asynchronously request notification permissions
//        DispatchQueue.main.async {
//            self.requestNotificationPermissions()
//        }
//        return true
        UNUserNotificationCenter.current().delegate = self
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
    
    // Handle notification when the app is in the foreground
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.banner, .sound])
        }
    
    // Handle notification tap action
       func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
           print("Notification received with identifier: \(response.notification.request.identifier)")
           completionHandler()
       }
    
}

