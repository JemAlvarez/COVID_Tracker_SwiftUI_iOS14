//

import SwiftUI

class WorldViewModel: ObservableObject {
    let columns = [GridItem(), GridItem()]
    @Published var landscape = UIDevice.current.orientation.isValidInterfaceOrientation
    
    @Published var world: World?
    
    init() {
        ApiRequest.shared.getWorld { world in
            withAnimation {
                self.world = world
            }
        }
    }
}
