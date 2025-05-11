//

import SwiftUI

final class ScanCoordinatorViewModel: ObservableObject {
    
    unowned let coordinator: ScanCoordinator
 
    init(coordinator: ScanCoordinator) {
        self.coordinator = coordinator
    }
}
