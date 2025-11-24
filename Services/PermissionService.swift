import Foundation
import Photos
import Contacts
import UserNotifications

class PermissionService: ObservableObject {
    @Published var photoPermissionStatus: PHAuthorizationStatus = .notDetermined
    @Published var contactPermissionStatus: CNAuthorizationStatus = .notDetermined
    @Published var notificationPermissionStatus: UNAuthorizationStatus = .notDetermined
    
    static let shared = PermissionService()
    
    private init() {
        checkPhotoPermission()
        checkContactPermission()
        checkNotificationPermission()
    }
    
    // MARK: - Photos
    func checkPhotoPermission() {
        photoPermissionStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
    }
    
    func requestPhotoPermission() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            DispatchQueue.main.async {
                self.photoPermissionStatus = status
            }
        }
    }
    
    // MARK: - Contacts
    func checkContactPermission() {
        contactPermissionStatus = CNContactStore.authorizationStatus(for: .contacts)
    }
    
    func requestContactPermission() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, error in
            DispatchQueue.main.async {
                self.checkContactPermission()
            }
        }
    }
    
    // MARK: - Notifications
    func checkNotificationPermission() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.notificationPermissionStatus = settings.authorizationStatus
            }
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            DispatchQueue.main.async {
                self.checkNotificationPermission()
            }
        }
    }
}
