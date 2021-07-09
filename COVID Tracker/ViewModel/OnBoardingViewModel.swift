import Foundation
import SwiftUI

class OnBoardingViewModel: ObservableObject {
    let screens: [(graphic: Assets.Graphics, text: String)] =
        [(graphic: .washing, text: "Wash your hands"), (graphic: .mask, text: "Protect yourself"), (graphic: .old_man, text: "Protect the elderly"), (graphic: .online, text: "Online check-ups"), (graphic: .sick, text: "Avoid interactions if sick"), (graphic: .distancing, text: "Social distancing"), (graphic: .home, text: "Stay at home")]
    @Published var page = 0
    
    func previousScreen() {
        if page > 0 {
            withAnimation {
                page -= 1
            }
        }
    }
    
    func nextScreen() {
        if page < screens.count - 1 {
            withAnimation {
                page += 1
            }
        }
    }
}
