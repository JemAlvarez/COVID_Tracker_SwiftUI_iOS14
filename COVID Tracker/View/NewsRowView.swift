//

import SwiftUI

struct NewsRowView: View {
    let title: String
    let description: String
    let source: String
    let date: String
    
    var body: some View {
        HStack {
            VStack (spacing: 5) {
                Group {
                    Text(title)
                        .font(.title2)
                        .lineLimit(1)
                    Text(description)
                        .lineLimit(2)
                    Text("\(source) - \(date)")
                        .font(.callout)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Image(systemName: "chevron.right")
                .foregroundColor(Color(Assets.shared.getColor(.skin)))
        }
        .padding()
        .background(Color(Assets.shared.getColor(.mint)))
        .cornerRadius(15)
        .padding()
        .foregroundColor(Color(Assets.shared.getColor(.leafy)))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView(title: "title", description: "desc", source: "source", date: "date")
    }
}
