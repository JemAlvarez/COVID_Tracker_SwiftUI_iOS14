//

import Foundation

class TabBarViewModel: ObservableObject {
    let tabs: [(name: String, image: String)] = [(name: "World", image: "globe"), (name: "Continents", image: "map.fill"), (name: "", image: "magnifyingglass"), (name: "Articles", image: "doc.richtext"), (name: "Settings", image: "gearshape.fill")]
    @Published var tab = 0
}
