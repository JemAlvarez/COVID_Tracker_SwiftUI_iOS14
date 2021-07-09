//

import Foundation

struct CountriesInfo {
    static let shared = CountriesInfo()
    
    func getCountryFalg(_ iso: String) -> String {
        let base = 127397
        var tempScalarView = String.UnicodeScalarView()
        for i in iso.utf16 {
            if let scalar = UnicodeScalar(base + Int(i)) {
                tempScalarView.append(scalar)
            }
        }
        
        return String(tempScalarView)
    }
    
    func getAllCountriesInfo() -> [CountrySearchModel] {
        var countries: [CountrySearchModel] = []
        
        for iso in NSLocale.isoCountryCodes {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: iso])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country '\(iso)' not found"
            
            countries.append(CountrySearchModel(iso: iso, name: name, flag: getCountryFalg(iso)))
        }
        
        return countries
    }
}
