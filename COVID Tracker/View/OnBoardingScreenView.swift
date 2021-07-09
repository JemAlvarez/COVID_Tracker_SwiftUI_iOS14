//

import SwiftUI

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

struct OnBoardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreenView {
            Image("")
        } text: {
            Text("")
        }

    }
}
