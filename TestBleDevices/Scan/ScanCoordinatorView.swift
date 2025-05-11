//

import SwiftUI

struct ScanCoordinatorView: View {
    
    // MARK: Stored Properties
    
    @ObservedObject var coordinator: ScanCoordinator
    
    // MARK: Views
    
    var body: some View {
        NavigationView {
            if let vm = coordinator.viewModel {
                ScanView(vmCoordinator: vm)
                    .navigation(item: $coordinator.secondCoordinator) { coordinator in
                        SettingsCoordinatorView(coordinator: coordinator)
                    }
                    .hideTabbar(shouldHideTabbar: false)
            }
        }
    }
}
