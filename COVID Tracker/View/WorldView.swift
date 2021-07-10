//

import SwiftUI

struct WorldView: View {
    let columns = [GridItem(), GridItem()]
    @State private var landscape = UIDevice.current.orientation.isValidInterfaceOrientation
    
    var body: some View {
        ZStack {
            Color(Assets.shared.getColor(.snow)).edgesIgnoringSafeArea(.all)
            
            if !landscape {
                WorldHeaderView()
            }
            
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
                    
                    Text("Last updated 1 hour ago")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .opacity(0.7)
                }
                .padding(.bottom, 50)
                
                LazyVGrid(columns: columns) {
                    InfoBoxView(heading: "Cases", number: 186812865, change: 485693)
                    InfoBoxView(heading: "Deaths", number: 4035725, change: 8184)
                    InfoBoxView(heading: "Recovered", number: 170873157, change: 357162)
                    InfoBoxView(heading: "Active", number: 1138849, change: nil)
                }
                
                MoreView {
                    LazyVGrid(columns: columns) {
                        InfoBoxView(heading: "Critical", number: 77755, change: nil)
                        InfoBoxView(heading: "Tests", number: 2810552146, change: nil)
                        InfoBoxView(heading: "population", number: 7863326695, change: nil)
                        InfoBoxView(heading: "Countries", number: 222, change: nil)
                    }
                }
                .padding(.bottom, 50)
            }
            .padding(.horizontal)
        }
        .foregroundColor(Color(Assets.shared.getColor(.leafy)))
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            landscape = UIDevice.current.orientation.isPortrait
        }
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
