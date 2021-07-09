//

import SwiftUI

struct OnBoardingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color(Assets.shared.getColor(.leafy)))
            .padding(5)
            .padding(.horizontal, 10)
            .background(Color(Assets.shared.getColor(.mint)))
            .clipShape(Capsule())
    }
}
