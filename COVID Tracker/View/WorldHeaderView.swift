//

import SwiftUI

struct WorldHeaderView: View {
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color(Assets.shared.getColor(.mint)))
            
                Image(Assets.shared.getIcon(.virus))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .offset(x: UIScreen.main.bounds.width / 2.3, y: -(UIScreen.main.bounds.height / 3.5) / 2.5)
                
                ZStack {
                    Image(Assets.shared.getIcon(.virus))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .offset(x: UIScreen.main.bounds.width / 2.3, y: (UIScreen.main.bounds.height / 3.5) / 3.3)
                    
                    Image(Assets.shared.getIcon(.virus))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .offset(x: -UIScreen.main.bounds.width / 2.3, y: (UIScreen.main.bounds.height / 3.5) / 2.5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(Rectangle())
            }
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height / 3.5)
            
            Spacer()
        }
    }
}

struct WorldHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WorldHeaderView()
    }
}
