//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchString: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchString)
                .padding(.vertical , 10)
                .padding(.horizontal)
                .foregroundColor(Color(Assets.shared.getColor(.leafy)))
                .background(Color(Assets.shared.getColor(.mint)))
                .cornerRadius(99)
                .colorScheme(.light)
            
            if !searchString.isEmpty {
                Button(action: {
                    searchString = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                }
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchString: .constant(""))
    }
}
