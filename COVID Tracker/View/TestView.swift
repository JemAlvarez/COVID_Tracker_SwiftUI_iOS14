//

import SwiftUI

struct TestView: View {
    @State var country: CountryModel?
    
    var body: some View {
        VStack {
            if country != nil {
                Text(country!.country?.country ?? "No country found")
                Text(country!.moreData?.All.capital_city ?? "No data found")
                Text(country!.flag ?? "Flag not found")
                    .font(.largeTitle)
            }
        }
        .onAppear{
            ApiRequest.shared.getCountry(country: "AU") { country in
                self.country = country
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
