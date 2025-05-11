//

import SwiftUI

struct MainCoordinatorView: View {
    
    // MARK: Stored Properties
    
    @ObservedObject var coordinator: MainCoordinator
    
    // MARK: Views
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            ScanCoordinatorView(
                coordinator: coordinator.firstCoordinator
            )
            .tabItem { Label("Scan", systemImage: "doc.text.magnifyingglass") }
            .tag(MainTab.scan)
            
            SettingsCoordinatorView(
                coordinator: coordinator.secondCoordinator
            )
            .tabItem { Label("Settings", systemImage: "gear") }
            .tag(MainTab.settings)
        }
    }
}

