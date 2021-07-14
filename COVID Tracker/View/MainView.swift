//

import SwiftUI

struct MainView: View {
    @StateObject var tabBarViewModel = TabBarViewModel()
    
    var body: some View {
        VStack (spacing: 0) {
            VStack (spacing: 0) {
                switch tabBarViewModel.tab {
                case 0:
                    WorldView()
                case 1:
                    ContinentsView()
                case 2:
                    SearchView()
                case 3:
                    NewsView()
                case 4:
                    SettingsView()
                default:
                    EmptyView()
                }
            }
            .frame(maxHeight: .infinity)
            .padding(0)
            
            TabBarView()
        }
        .background(Color(Assets.shared.getColor(.snow)).edgesIgnoringSafeArea(.all))
        .environmentObject(tabBarViewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
