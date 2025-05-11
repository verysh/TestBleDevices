//

import SwiftUI

@MainActor
final class ScanCoordinator: ObservableObject, Identifiable {
    
    private weak var parent: MainCoordinator?
    @Published var viewModel: ScanCoordinatorViewModel?
    @Published var secondCoordinator: SettingsCoordinator?
    
    init(parent: MainCoordinator?) {
        self.parent = parent
        self.viewModel = ScanCoordinatorViewModel(coordinator: self)
    }
    
    func openSecond() {
        secondCoordinator = SettingsCoordinator(parent: parent, isTabbarHidden: true, willChangeTabTo: .settings)
    }
}

