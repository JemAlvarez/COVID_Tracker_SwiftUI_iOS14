//

import SwiftUI

struct OnBoardingView: View {
    @State var page = 0
    
    var body: some View {
        VStack {
            switch page {
            case 0:
                OnBoardingScreenView {
                    Image(Assets.shared.getGraphic(.distancing))
                        .resizable()
                        .scaledToFit()
                } text: {
                    Text("Social Distancing.")
                }
            case 1:
                OnBoardingScreenView {
                    Image(Assets.shared.getGraphic(.home))
                        .resizable()
                        .scaledToFit()
                } text: {
                    Text("Stay at home.")
                }
            case 2:
                OnBoardingScreenView {
                    Image(Assets.shared.getGraphic(.online))
                        .resizable()
                        .scaledToFit()
                } text: {
                    Text("Online checkups.")
                }
            default:
                EmptyView()
            }
            
            HStack {
                ForEach(0..<3) { i in
                    Capsule()
                        .frame(width: i == page ? 50 : 10, height: 10)
                        .foregroundColor(Color(Assets.shared.getColor(.mint)))
                }
            }
            .frame(width: UIScreen.main.bounds.width / 3, height: 10)
            
            Spacer()
            
            HStack {
                Button(action: {
                    if page > 0 {
                        withAnimation {
                            page -= 1
                        }
                    }
                }) {
                    Text("Back")
                        .foregroundColor(Color(Assets.shared.getColor(.leafy)))
                        .padding(5)
                        .padding(.horizontal, 10)
                        .background(Color(Assets.shared.getColor(.mint)).opacity(page == 0 ? 0.4 : 1))
                        .clipShape(Capsule())
                }
                
                Spacer()
                
                Button(action: {
                    if page < 2 {
                        withAnimation {
                            page += 1
                        }
                    }
                }) {
                    Text(page == 2 ? "Finish" : "Next")
                        .foregroundColor(Color(Assets.shared.getColor(.leafy)))
                        .padding(5)
                        .padding(.horizontal, 10)
                        .background(Color(Assets.shared.getColor(.mint)))
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(Assets.shared.getColor(.leafy)).edgesIgnoringSafeArea(.all))
    }
}

struct OnBoardingScreenView<Img: View, Txt: View>: View {
    let image: Img
    let text: Txt

    init(@ViewBuilder image: () -> Img, text: () -> Txt) {
        self.image = image()
        self.text = text()
    }

    var body: some View {
        VStack {
            Spacer()
            text
                .font(.largeTitle)
                .foregroundColor(Color(Assets.shared.getColor(.snow)))
            Spacer()
            image
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .padding(.horizontal, 50)
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
