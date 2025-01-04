# OneLife

OneLife is an intuitive SwiftUI application that allows users to record and manage daily moments. Designed to create a meaningful daily journaling habit, it provides reminders, secure data storage, and export capabilities.

---

## Features

1. **Record Daily Moments**:
   - Add, edit, and delete daily moments with ease.
   - Multi-line text support for detailed entries.

2. **Calendar Integration**:
   - View moments sorted by date.
   
3. **Reminders**:
   - Schedule daily notifications at 8 PM to remind you to record your moment.

4. **iCloud Backup**:
   - All moments are securely backed up in your iCloud account.

5. **Export Moments**:
   - Export all recorded moments via email as plain text.
---

## Technical Details

- **Language**: Swift
- **Frameworks**:
  - SwiftUI
  - Core Data (with CloudKit integration)
  - UserNotifications
  - MessageUI

- **Core Features**:
  - `NSPersistentCloudKitContainer` for Core Data synchronization with iCloud.
  - `UNUserNotificationCenter` for managing notifications.
  - `MFMailComposeViewController` for email export functionality.

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/OneLife.git
   ```

2. Open the project in Xcode:
   ```bash
   open OneLife.xcodeproj
   ```

3. Run the app on a simulator or connected device:
   - Select your target device.
   - Press `Command + R`.

---

## Usage

1. Open the app and tap **Add Today's Moment** to record your daily moment.
2. Edit or delete moments by tapping on them in the list.
3. Use the **Export Moments** button to email all recorded moments.
4. Daily reminders will notify you to update your moment at 8 PM.

---

## Contributing

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature-name"
   ```
4. Push the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

---
