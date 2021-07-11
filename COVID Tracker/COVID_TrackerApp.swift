//

import SwiftUI

@main
struct COVID_TrackerApp: App {
    @AppStorage(UserDefaultsModel.shared.getKey(.onboarding)) var onboardingFinished = false
    
    var body: some Scene {
        WindowGroup {
            if onboardingFinished {
                MainView()
                    .foregroundColor(Color(Assets.shared.getColor(.snow)))
            } else {
                OnBoardingView()
            }
        }
    }
}
