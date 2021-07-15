//

import SwiftUI

struct CountryInfoView: View {
    let country: CountryModel
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        ZStack {
            Color(Assets.shared.getColor(.snow)).edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                Group {
                    Text("Last updated \(Date(timeIntervalSince1970: TimeInterval(country.country!.updated / 1000)).relativeTimeFormat())")
                        .opacity(0.7)
                        .padding([.bottom, .top])
                    
                    if country.moreData != nil {
                        Text("Capital city: \(country.moreData!.All.capital_city)")
                        Text("Population: \(country.moreData!.All.population)")
                        Text("Life expectancy: \(country.moreData!.All.life_expectancy)")
                    }
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: columns) {
                    InfoBoxView(heading: "cases", number: country.country!.cases, change: country.country!.todayCases)
                    InfoBoxView(heading: "deaths", number: country.country!.deaths, change: country.country!.todayDeaths)
                    InfoBoxView(heading: "recovered", number: country.country!.recovered, change: nil)
                    InfoBoxView(heading: "active", number: country.country!.active, change: nil)
                    InfoBoxView(heading: "critical", number: country.country!.critical, change: nil)
                    InfoBoxView(heading: "tests", number: country.country!.tests, change: nil)
                    
                    if country.moreData != nil {
                        InfoBoxView(heading: "Administered", number: country.moreData!.All.administered, change: nil)
                        InfoBoxView(heading: "Vaccinated", number: country.moreData!.All.people_vaccinated, change: nil)
                    }
                }
                .padding(.bottom)
            }
            .foregroundColor(Color(Assets.shared.getColor(.leafy)))
        }
    }
}

//struct CountryInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryInfoView()
//    }
//}
