//

import SwiftUI

@main
struct COVID_TrackerApp: App {
    @AppStorage(UserDefaultsModel.shared.getKey(.onboarding)) var onboardingFinished = false
    
    init() {
        // nav bar foreground color
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color(Assets.shared.getColor(.leafy)))]
        
        // segmented picker colors
        UISegmentedControl.appearance().backgroundColor = UIColor(Color(Assets.shared.getColor(.mint)))
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color(Assets.shared.getColor(.leafy)))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color(Assets.shared.getColor(.snow)))], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color(Assets.shared.getColor(.leafy)))], for: .normal)
    }
    
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
