//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: NewsModel?
    
    init() {
        ApiRequest.shared.getNewsArticles { news in
            self.news = news
        }
    }
    
//    func sort() {
//        print("SORTING")
//    }
}
