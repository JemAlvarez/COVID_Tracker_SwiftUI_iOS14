//

import SwiftUI

struct NewsView: View {
    @ObservedObject var model = NewsViewModel()
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Assets.shared.getColor(.snow)).edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    HStack {
                        Text("News Articles \(model.news != nil ? (model.news!.totalResults > 50 ? "(50)" : "(\(model.news!.totalResults))") : "")")
                            .font(.title.bold())
                        
                        Spacer()
                        
                        Button(action: {
                            model.sort.toggle()
                            if model.news != nil {
                                model.sort(array: model.news!.articles, descending: model.sort)
                            }
                        }) {
                            Image(systemName: model.sort ? "arrow.down.doc.fill" : "arrow.up.doc.fill")
                                .font(.title2)
                        }
                    }
                    .padding()
                    .padding(.top)
                    .foregroundColor(Color(Assets.shared.getColor(.leafy)))
                    
                    LazyVStack {
                        if model.news != nil {
                            ForEach(0..<model.news!.articles.count) { i in
                                NavigationLink(destination:
                                                WebView(url: URL(string: model.news!.articles[i].url)!)
                                                .navigationTitle(model.news!.articles[i].title)
                                                .navigationBarTitleDisplayMode(.inline)
                                                .navigationBarItems(trailing:
                                                                        Button(action: {
                                                                            openURL(URL(string: model.news!.articles[i].url)!)
                                                                        }) {
                                                                            Image(systemName: "safari.fill")
                                                                        }
                                                )
                                )
                                {
                                    NewsRowView(title: model.news!.articles[i].title, description: model.news!.articles[i].description, source: model.news!.articles[i].source.name, date: model.news!.articles[i].publishedAt.isoToDate().format("MMMM d, yyyy h:mm a"))
                                }
                            }
                        } else {
                            ProgressView()
                                .colorScheme(.light)
                        }
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
