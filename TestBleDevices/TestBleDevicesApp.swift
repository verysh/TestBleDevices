//

import SwiftUI

@main
struct TestBleDevicesApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinatorView(coordinator: MainCoordinator())
        }
    }
}
