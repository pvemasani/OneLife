import SwiftUI
import UserNotifications

@main
struct DailyMomentApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        requestNotificationPermissions()
        scheduleDailyReminder() // Schedule the 8 PM notification
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }

    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
    
    private func scheduleDailyReminder() {
            let content = UNMutableNotificationContent()
            content.title = "Update Your Moment"
            content.body = "Don't forget to update your moment for today!"
            content.sound = .default

            var dateComponents = DateComponents()
            dateComponents.hour = 20 // 8 PM

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: "DailyMomentReminder", content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Failed to schedule notification: \(error.localizedDescription)")
                }
            }
        }
    }

