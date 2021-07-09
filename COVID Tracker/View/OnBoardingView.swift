//

import SwiftUI

struct OnBoardingView: View {
    @ObservedObject var viewModel = OnBoardingViewModel()
    
    var body: some View {
        VStack {
            ForEach(0..<viewModel.screens.count) { i in
                if i == viewModel.page {
                    OnBoardingScreenView {
                        Image(Assets.shared.getGraphic(viewModel.screens[i].graphic))
                            .resizable()
                            .scaledToFit()
                    } text: {
                        Text(viewModel.screens[i].text)
                    }
                }
            }
            
            HStack {
                ForEach(0..<viewModel.screens.count) { i in
                    Capsule()
                        .frame(width: i == viewModel.page ? 50 : 10, height: 10)
                        .foregroundColor(Color(Assets.shared.getColor(.mint)))
                }
            }
            .frame(width: UIScreen.main.bounds.width / 3, height: 10)
            
            Spacer()
            
            HStack {
                Button(action: viewModel.previousScreen) {
                    Text("Back")
                }
                .buttonStyle(OnBoardingButtonStyle())
                .opacity(viewModel.page == 0 ? 0.4 : 1)
                
                Spacer()
                
                Button(action: viewModel.nextScreen) {
                    Text(viewModel.page == viewModel.screens.count - 1 ? "Finish" : "Next")
                }
                .buttonStyle(OnBoardingButtonStyle())
            }
            .padding(.horizontal)
            .padding(.top, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(Assets.shared.getColor(.leafy)).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
