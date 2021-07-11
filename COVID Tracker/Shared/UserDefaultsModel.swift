//

import Foundation

struct UserDefaultsModel {
    static let shared = UserDefaultsModel()
    
    enum Keys {
        case onboarding
    }
    
    func getKey(_ key: Keys) -> String {
        switch key {
        case .onboarding:
            return "onboarding"
        }
    }
    
    func setKey(key: Keys, value: Any) {
        UserDefaults.standard.set(value, forKey: getKey(key))
    }
    
    func getKey(_ key: Keys) -> Any? {
        return UserDefaults.standard.object(forKey: getKey(key))
    }
}
