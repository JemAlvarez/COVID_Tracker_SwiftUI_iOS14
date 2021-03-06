//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var model: TabBarViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .offset(y: 80)
                .foregroundColor(Color(Assets.shared.getColor(.leafy)))
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Spacer()
                
                ForEach(0..<model.tabs.count) { i in
                    if model.tabs[i].name != "" {
                        VStack (spacing: 5) {
                            Image(systemName: model.tabs[i].image)
                                .font(.title3)
                            
                            Text(model.tabs[i].name)
                                .font(.footnote)
                        }
                        .onTapGesture {
                            if model.tab != i {
                                model.tab = i
                            }
                        }
                        .foregroundColor(model.tab == i ? Color(Assets.shared.getColor(.skin)) : Color(Assets.shared.getColor(.snow)))
                    }
                    
                    Spacer()
                }
            }
            
            ForEach(0..<model.tabs.count) { i in
                if model.tabs[i].name == "" {
                    VStack {
                        Image(systemName: model.tabs[i].image)
                            .font(.title)
                    }
                    .padding(20)
                    .background(Color(Assets.shared.getColor(model.tab == 2 ? .skin : .mocha)))
                    .clipShape(Circle())
                    .offset(y: -40)
                    .shadow(radius: 10)
                    .foregroundColor(Color(Assets.shared.getColor(.snow)))
                    .onTapGesture {
                        if model.tab != i {
                            model.tab = i
                        }
                    }
                }
            }
        }
        .frame(height: 80)
        .background(Color(Assets.shared.getColor(.leafy)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(TabBarViewModel())
    }
}
