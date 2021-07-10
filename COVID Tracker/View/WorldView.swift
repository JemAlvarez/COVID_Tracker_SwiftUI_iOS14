//

import SwiftUI

struct WorldView: View {
    var body: some View {
        ZStack {
            Color(Assets.shared.getColor(.snow)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height / 3.5)
                    .foregroundColor(Color(Assets.shared.getColor(.leafy)))
                
                Spacer()
            }
            
            ScrollView(showsIndicators: false) {
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
            .padding(.horizontal)
        }
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
