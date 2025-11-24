import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "square.grid.2x2")
                }
            
            PhotoCleanerView()
                .tabItem {
                    Label("Photos", systemImage: "photo")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .accentColor(Color.blue) // Placeholder, will be replaced by Theme color
    }
}


