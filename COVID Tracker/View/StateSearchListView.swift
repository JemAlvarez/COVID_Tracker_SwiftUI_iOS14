//

import SwiftUI

struct StateSearchListView: View {
    @Binding var searchString: String
    
    var body: some View {
        SearchListView {
            ForEach(States.all, id: \.self) { state in
                if searchString.isEmpty || state.lowercased().contains(searchString.lowercased()) {
                    Divider()
                    NavigationLink(destination: InfoView(countryIso: nil, stateName: state).colorScheme(.light)) {
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

//struct StateSearchListView_Previews: PreviewProvider {
//    static var previews: some View {
//        StateSearchListView()
//    }
//}
