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
                    Text("1")
                case 2:
                    Text("2")
                case 3:
                    Text("3")
                case 4:
                    SettingsView()
                default:
                    EmptyView()
                }
            }
            .animation(.none)
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
