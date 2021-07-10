//

import SwiftUI

struct InfoBoxView: View {
    let heading: String
    let number: Int
    let change: Int?
    
    var body: some View {
        VStack (spacing: 20) {
            Text(heading.uppercased())
                .font(.headline)
            
            Text("\(number)")
                .font(.title3)
            
            Label("\(change ?? 0)", systemImage: "arrow.up")
                .foregroundColor(.red)
                .font(.footnote)
                .opacity(change == nil ? 0 : 1)
        }
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity)
        .background(Color(Assets.shared.getColor(.snow)))
        .cornerRadius(15)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct InfoBoxView_Previews: PreviewProvider {
    static var previews: some View {
        InfoBoxView(heading: "Confirmed", number: 753, change: 18)
    }
}
