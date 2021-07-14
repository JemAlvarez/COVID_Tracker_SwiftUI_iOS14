import SwiftUI
import MapKit

struct ContinentsView: View {
    @ObservedObject var model = ContinentsViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                Map(coordinateRegion: $model.region, interactionModes: [.pan], annotationItems: model.annotations, annotationContent: {
                    n in MapAnnotation(coordinate: n.coordinates) {
                        if model.continents != nil {
                            ForEach(0..<model.continents!.count) { i in
                                if model.continents![i].continent == n.name {
                                    ZStack {
                                        Circle().strokeBorder(Color.red, lineWidth: 2)
                                            .background(Circle().foregroundColor(Color.red.opacity(0.5)))
                                        
                                        Image(systemName: "info.circle.fill")
                                            .foregroundColor(Color(Assets.shared.getColor(.snow)))
                                    }
                                    .frame(width: CGFloat(model.continents![i].cases) / 200000, height: CGFloat(model.continents![i].cases) / 200000)
                                    .padding(n.name == "Australia-Oceania" ? 10 : 0)
                                    .onTapGesture {
                                        model.selectedContinent = model.continents![i]
                                        withAnimation {
                                            model.showingSheet = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Continents")
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
            if model.selectedContinent != nil {
                ContinentsSheetView(showing: $model.showingSheet, continent: model.selectedContinent!)
                    .offset(y: model.showingSheet ? 0 : UIScreen.main.bounds.height)
            }
        }
    }
}

struct ContinentsView_Previews: PreviewProvider {
    static var previews: some View {
        ContinentsView()
    }
}
