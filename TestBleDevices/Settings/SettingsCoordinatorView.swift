//

import SwiftUI

struct SettingsCoordinatorView: View {
    
    // MARK: Stored Properties
    
    @ObservedObject var coordinator: SettingsCoordinator
    
    // MARK: Views
    
    var body: some View {
        SettingsView(viewModel: coordinator.viewModel)
            .hideTabbar(shouldHideTabbar: coordinator.isTabbarHidden)
    }
}

