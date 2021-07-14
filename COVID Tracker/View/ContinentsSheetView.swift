//

import SwiftUI

struct ContinentsSheetView: View {
    @Binding var showing: Bool
    let continent: Continent
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height / 3.2)
                .opacity(0)
                .onTapGesture {
                    withAnimation {
                        showing = false
                    }
                }
            
            VStack {
                HStack {
                    VStack {
                        Group {
                            Text(continent.continent)
                                .font(.title.bold())
                                .foregroundColor(Color(Assets.shared.getColor(.snow)))
                            
                            Group {
                                Text("Population - \(continent.population)")
                                Text("Last updated \(Date(timeIntervalSince1970: TimeInterval(continent.updated / 1000)).relativeTimeFormat())")
                            }
                            .font(.callout)
                            .foregroundColor(Color(Assets.shared.getColor(.mint)))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Button(action: {
                        withAnimation {
                            showing = false
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(Assets.shared.getColor(.mint)))
                            .font(.title2)
                    }
                }
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 0) {
                        InfoBoxView(heading: "Cases", number: continent.cases, change: continent.todayCases)
                        InfoBoxView(heading: "Deaths", number: continent.deaths, change: continent.todayDeaths)
                        InfoBoxView(heading: "Recovered", number: continent.recovered, change: continent.todayRecovered)
                        InfoBoxView(heading: "Active", number: continent.active, change: nil)
                        InfoBoxView(heading: "Critical", number: continent.critical, change: nil)
                        InfoBoxView(heading: "Tests", number: continent.tests, change: nil)
                    }
                }
                .foregroundColor(Color(Assets.shared.getColor(.leafy)))
            }
            .padding(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 30).fill(Color(Assets.shared.getColor(.leafy))))
            .edgesIgnoringSafeArea(.all)
        }
        .frame(maxHeight: .infinity)
    }
}

struct ContinentsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ContinentsSheetView(showing: .constant(true), continent: Continent(updated: 0, cases: 0, todayCases: 0, deaths: 0, todayDeaths: 0, recovered: 0, todayRecovered: 0, active: 0, critical: 0, casesPerOneMillion: 0, deathsPerOneMillion: 0, tests: 0, testsPerOneMillion: 0, population: 0, activePerOneMillion: 0, recoveredPerOneMillion: 0, criticalPerOneMillion: 0, continent: "America"))
    }
}
