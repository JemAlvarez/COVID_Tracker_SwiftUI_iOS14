//

import SwiftUI

struct CountrySearchListView: View {
    @Binding var searchString: String
    
    var body: some View {
        SearchListView {
            ForEach(CountriesInfo.shared.getAllCountriesInfo()) {country in
                if searchString.isEmpty || country.name.lowercased().contains(searchString.lowercased()) {
                    Divider()
                    NavigationLink(destination: InfoView(countryIso: country.iso, stateName: nil).colorScheme(.light)) {
                        HStack {
                            Text(country.flag)
                                .font(.largeTitle)
                            Spacer()
                            Text(country.name)
                                .bold()
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                }
            }
        }
    }
}

//struct CountrySearchListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountrySearchListView()
//    }
//}
