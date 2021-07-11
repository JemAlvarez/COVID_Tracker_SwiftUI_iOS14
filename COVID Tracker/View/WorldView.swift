//

import SwiftUI

struct WorldView: View {
    @ObservedObject var model = WorldViewModel()
    
    var body: some View {
        ZStack {
            Color(Assets.shared.getColor(.snow)).edgesIgnoringSafeArea(.all)
            
            if !model.landscape {
                WorldHeaderView()
            }
            
            if model.world != nil {
                ScrollView(showsIndicators: false) {
                    VStack {
                        Text("Covid-19 Tracker")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        Text("Worldwide 🌎")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
                        Text("Last updated \(Date(timeIntervalSince1970: TimeInterval(model.world!.updated / 1000)).relativeTimeFormat())")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .opacity(0.7)
                    }
                    .padding(.bottom, 50)
                    
                    LazyVGrid(columns: model.columns) {
                        InfoBoxView(heading: "Cases", number: model.world!.cases, change: model.world!.todayCases)
                        InfoBoxView(heading: "Deaths", number: model.world!.deaths, change: model.world!.todayDeaths)
                        InfoBoxView(heading: "Recovered", number: model.world!.recovered, change: model.world!.todayRecovered)
                        InfoBoxView(heading: "Active", number: model.world!.active, change: nil)
                    }
                    
                    MoreView {
                        LazyVGrid(columns: model.columns) {
                            InfoBoxView(heading: "Critical", number: model.world!.critical, change: nil)
                            InfoBoxView(heading: "Tests", number: model.world!.tests, change: nil)
                            InfoBoxView(heading: "population", number: model.world!.population, change: nil)
                            InfoBoxView(heading: "Countries", number: model.world!.affectedCountries, change: nil)
                        }
                    }
                    .padding(.bottom, 50)
                }
                .padding(.horizontal)
            } else {
                ProgressView()
                    .colorScheme(.light)
            }
        }
        .foregroundColor(Color(Assets.shared.getColor(.leafy)))
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            model.landscape = UIDevice.current.orientation.isPortrait
        }
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
