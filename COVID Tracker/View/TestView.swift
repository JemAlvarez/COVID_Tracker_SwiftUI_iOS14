//

import SwiftUI

struct TestView: View {
    @State var countries: [CountrySearchModel] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(countries) {country in
                    Text("\(country.iso) - \(country.name) - \(country.flag)")
                }
            }
        }
        .onAppear{
            countries = CountriesInfo.shared.getAllCountriesInfo()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
