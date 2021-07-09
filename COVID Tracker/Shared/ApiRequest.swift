import Foundation

class ApiRequest {
    static let shared = ApiRequest()
    
    // base request
    private func request(url: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                completion(data)
            }
        }
        .resume()
    }
    
    // new request
    func getNewsArticles(url: String, apiKey: String, completion: @escaping (NewsModel) -> ()) {
        request(url: "\(url)\(apiKey)") { data in
            let news = try! JSONDecoder().decode(NewsModel.self, from: data!)
            
            DispatchQueue.main.async {
                completion(news)
            }
        }
    }
}
