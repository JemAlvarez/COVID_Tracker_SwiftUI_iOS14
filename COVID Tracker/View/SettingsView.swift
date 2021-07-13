//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var model = SettingViewModel()
    @AppStorage(UserDefaultsModel.shared.getKey(.onboarding)) var onboardingFinished = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Assets.shared.getColor(.snow)).edgesIgnoringSafeArea(.all)
                
                VStack (spacing: 25) {
                    HStack {
                        Text("App Version")
                            .bold()
                        Spacer()
                        Text(model.version ?? "-")
                            .bold()
                    }
                    .padding()
                    .background(Color(Assets.shared.getColor(.mint)))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            onboardingFinished = false
                        }) {
                            Text("Reset Onboarding!")
                                .bold()
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(Assets.shared.getColor(.mint)))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top)
                .foregroundColor(Color(Assets.shared.getColor(.leafy)))
            }
            .navigationTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
