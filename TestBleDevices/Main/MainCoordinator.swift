//


import Foundation
import SwiftUI

enum MainTab {
    case scan
    case settings
}

@MainActor
final class MainCoordinator: ObservableObject {

    // MARK: Stored Properties
    
    @Published var tab = MainTab.scan
    
    @Published var firstCoordinator: ScanCoordinator!
    @Published var secondCoordinator: SettingsCoordinator!
    
    init() {
        firstCoordinator = .init(parent: self)
        secondCoordinator = .init(parent: self, isTabbarHidden: false, willChangeTabTo: .scan)
    }
}
