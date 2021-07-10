//

import SwiftUI

@main
struct COVID_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .foregroundColor(Color(Assets.shared.getColor(.snow)))
        }
    }
}
