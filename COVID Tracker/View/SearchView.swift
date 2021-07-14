//

import SwiftUI

struct SearchView: View {
    @ObservedObject var model = SearchViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Assets.shared.getColor(.snow)).edgesIgnoringSafeArea(.all)
                
                VStack {
                    SearchBarView(searchString: $model.searchString.animation())
                    
                    Picker(selection: $model.countriesSelected.animation(), label: Text(""), content: {
                        Text("Countries").tag(true)
                        Text("States").tag(false)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .colorScheme(.light)
                    
                    Group {
                        if model.countriesSelected {
                            CountrySearchListView(searchString: $model.searchString)
                        } else {
                            StateSearchListView(searchString: $model.searchString)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .foregroundColor(Color(Assets.shared.getColor(.leafy)))
                .padding(.horizontal)
                .navigationTitle("Search")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
