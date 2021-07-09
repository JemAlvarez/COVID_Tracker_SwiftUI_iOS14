import Foundation

struct CountrySearchModel: Identifiable {
    let id = UUID()
    let iso: String
    let name: String
    let flag: String
}
