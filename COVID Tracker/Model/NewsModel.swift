import Foundation

struct NewsModel: Codable {
    let totalResults: Int
    var articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String
    let publishedAt: String
    let url: String
}

struct Source: Codable {
    let name: String
}
