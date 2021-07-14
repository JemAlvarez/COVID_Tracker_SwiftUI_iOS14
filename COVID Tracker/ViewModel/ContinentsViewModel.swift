//

import SwiftUI
import MapKit

class ContinentsViewModel: ObservableObject {
    let annotations = [
        ContinentsLocationModel(name: "North America", coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(46.0730555556), longitude: CLLocationDegrees(-100.546666667))),
        ContinentsLocationModel(name: "Asia", coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(29.8405555556), longitude: CLLocationDegrees(89.2966666667))),
        ContinentsLocationModel(name: "South America", coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(-14.6047222222), longitude: CLLocationDegrees(-57.6561111111))),
        ContinentsLocationModel(name: "Europe", coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(48.6908333333), longitude: CLLocationDegrees(9.14055555556))),
        ContinentsLocationModel(name: "Africa", coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(7.18805555556), longitude: CLLocationDegrees(21.0936111111))),
        ContinentsLocationModel(name: "Australia-Oceania", coordinates: CLLocationCoordinate2D(latitude: CLLocationDegrees(-18.3127777778), longitude: CLLocationDegrees(138.515555556)))
    ]
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 21.5218, longitude: -77.7812), span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    @Published var showingSheet = false
    @Published var continents: [Continent]?
    @Published var selectedContinent: Continent?
    
    init() {
        ApiRequest.shared.getContinents { continents in
            self.continents = continents
            self.selectedContinent = continents[0]
        }
    }
}
