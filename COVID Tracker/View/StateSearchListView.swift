//

import SwiftUI

struct StateSearchListView: View {
    @Binding var searchString: String
    
    var body: some View {
        SearchListView {
            if searchString.isEmpty {
                ForEach(States.all, id: \.self) { state in
                    Divider()
                    NavigationLink(destination: InfoView()) {
                        HStack {
                            Text(state)
                                .bold()
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding(.vertical, 5)
                }
            } else {
                ForEach(States.all, id: \.self) { state in
                    if state.lowercased().contains(searchString.lowercased()) {
                        Divider()
                        NavigationLink(destination: InfoView()) {
                            HStack {
                                Text(state)
                                    .bold()
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
        }
    }
}

//struct StateSearchListView_Previews: PreviewProvider {
//    static var previews: some View {
//        StateSearchListView()
//    }
//}
