//
//  cleaner_anigravityApp.swift
//  cleaner_anigravity
//
//  Created by Nikita on 23.11.2025.
//

import SwiftUI

@main
struct cleaner_anigravityApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
