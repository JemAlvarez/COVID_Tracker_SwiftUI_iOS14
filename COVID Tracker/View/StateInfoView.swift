//

import SwiftUI

struct StateInfoView: View {
    let state: USState
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        ZStack {
            Color(Assets.shared.getColor(.snow)).edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                Group {
                    Text("Last updated \(Date(timeIntervalSince1970: TimeInterval(state.updated / 1000)).relativeTimeFormat())")
                        .opacity(0.7)
                        .padding([.bottom, .top])
                    
                    Text("Population: \(state.population)")
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: columns) {
                    InfoBoxView(heading: "cases", number: state.cases, change: state.todayCases)
                    InfoBoxView(heading: "deaths", number: state.deaths, change: state.todayDeaths)
                    InfoBoxView(heading: "recovered", number: state.recovered, change: nil)
                    InfoBoxView(heading: "active", number: state.active, change: nil)
                    InfoBoxView(heading: "tests", number: state.tests, change: nil)
                }
                .padding(.bottom)
            }
            .foregroundColor(Color(Assets.shared.getColor(.leafy)))
        }
    }
}

//struct StateInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        StateInfoView()
//    }
//}
