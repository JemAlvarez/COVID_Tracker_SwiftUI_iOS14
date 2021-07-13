//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: NewsModel?
    @Published var sort = true
    
    init() {
        ApiRequest.shared.getNewsArticles { news in
            self.news = news
            self.sort(array: self.news!.articles, descending: self.sort)
        }
    }
    
    func sort(array: [Article], descending: Bool) {
        if descending {
            news!.articles = array.sorted { $0.title < $1.title }
        } else {
            news!.articles = array.sorted { $1.title < $0.title }
        }
    }
}
