import SwiftUI

@main
struct CleanerApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark) // Enforce Dark Mode as per design
        }
    }
}
