//

import SwiftUI

@MainActor
final class SettingsCoordinatorViewModel: ObservableObject {
    
    private unowned let coordinator: SettingsCoordinator
    private let willChangeTabTo: MainTab
    
    init(coordinator: SettingsCoordinator, willChangeTabTo: MainTab) {
        self.coordinator = coordinator
        self.willChangeTabTo = willChangeTabTo
    }
    
    func changeTab() {
        coordinator.changeTab(with: willChangeTabTo)
    }
}
