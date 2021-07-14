//

import SwiftUI

struct CountrySearchListView: View {
    @Binding var searchString: String
    
    var body: some View {
        SearchListView {
            if searchString.isEmpty {
                ForEach(CountriesInfo.shared.getAllCountriesInfo()) {country in
                    Divider()
                    NavigationLink(destination: InfoView()) {
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
            } else {
                ForEach(CountriesInfo.shared.getAllCountriesInfo()) {country in
                    if country.name.lowercased().contains(searchString.lowercased()) {
                        Divider()
                        NavigationLink(destination: InfoView()) {
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
}

//struct CountrySearchListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountrySearchListView()
//    }
//}
