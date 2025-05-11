//

import SwiftUI

@MainActor
final class SettingsCoordinator: ObservableObject, Identifiable {
    
    var isTabbarHidden: Bool
    @Published var viewModel: SettingsCoordinatorViewModel!
    
    private unowned let parent: MainCoordinator?
    
    init(parent: MainCoordinator?, isTabbarHidden: Bool, willChangeTabTo: MainTab) {
        self.parent = parent
        self.isTabbarHidden = isTabbarHidden
        self.viewModel = SettingsCoordinatorViewModel(coordinator: self, willChangeTabTo: willChangeTabTo)
    }
    
    func changeTab(with tab: MainTab) {
        parent?.tab = tab
    }
}

