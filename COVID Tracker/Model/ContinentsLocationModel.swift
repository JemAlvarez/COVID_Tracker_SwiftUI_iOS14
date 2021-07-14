//

import Foundation
import CoreLocation

struct ContinentsLocationModel: Identifiable {
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
}
