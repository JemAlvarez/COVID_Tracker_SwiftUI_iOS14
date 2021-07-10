//

import SwiftUI

struct MoreView<Content: View>: View {
    @State var showing = false
    @ViewBuilder var content: () -> Content
    
    @ViewBuilder
    var body: some View {
        VStack {
            Label(showing ? "Hide" : "More", systemImage: "chevron.\(showing ? "up" : "down")")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(Color(Assets.shared.getColor(.skin)))
                .onTapGesture {
                    withAnimation {
                        showing.toggle()
                    }
                }
            
            if showing {
                content()
            }
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView {
            Text("A")
        }
    }
}
