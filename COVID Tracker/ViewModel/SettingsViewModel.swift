//

import SwiftUI

class SettingViewModel: ObservableObject {
    @Published var version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
}
