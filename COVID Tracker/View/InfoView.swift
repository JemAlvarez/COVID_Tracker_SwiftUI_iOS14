//

import SwiftUI

struct InfoView: View {
    let countryIso: String?
    let stateName: String?
    
    @State private var country: CountryModel?
    @State private var state: USState?
    
    @State var loading = true
    
    var body: some View {
        VStack {
            if loading {
                ProgressView()
            } else {
                if country?.country != nil {
                    CountryInfoView(country: country!)
                } else if state != nil {
                    StateInfoView(state: state!)
                } else {
                    Text("No Data Found.")
                        .font(.largeTitle)
                        .foregroundColor(Color(Assets.shared.getColor(.leafy)))
                }
            }
        }
        .navigationTitle(country?.country != nil ? "\(country!.country!.country) \(country!.flag != nil ? country!.flag! : "")" : (state != nil ? state!.state : ""))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if countryIso != nil && stateName == nil {
                ApiRequest.shared.getCountry(country: countryIso!) { country in
                    self.country = country
                    withAnimation {
                        loading = false
                    }
                }
            } else if countryIso == nil && stateName != nil {
                ApiRequest.shared.getState(state: stateName!) { state in
                    self.state = state
                    withAnimation {
                        loading = false
                    }
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(countryIso: "FR", stateName: nil)
    }
}
