//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var countriesSelected = true
    @Published var searchString = ""
}
