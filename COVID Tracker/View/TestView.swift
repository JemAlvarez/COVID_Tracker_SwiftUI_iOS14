//

import SwiftUI

struct TestView: View {
    @State var news: NewsModel?
    
    var body: some View {
        List {
            if news != nil {
                ForEach(0..<news!.articles.count) {i in
                    VStack {
                        Text(news!.articles[i].url)
                            .foregroundColor(.blue)
                            .underline()
                            .font(.caption2)
                        Text(news!.articles[i].title)
                            .font(.title)
                            .lineLimit(1)
                        Text(news!.articles[i].description)
                            .lineLimit(2)
                        Text("\(news!.articles[i].source.name) - \(news!.articles[i].publishedAt)")
                    }
                }
            }
        }
        .onAppear {
            ApiRequest.shared.getNewsArticles(url: URLs.news, apiKey: API_KEYS.NEWS_API_KEY) { news in
                self.news = news
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
