//

import SwiftUI

struct SearchListView<Content: View>: View {
    @ViewBuilder var content: () -> Content
    
    @ViewBuilder
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack (spacing: 0) {
                content()
            }
        }
    }
}

//struct SearchListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchListView()
//    }
//}
