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
    
    // news request
    func getNewsArticles(completion: @escaping (NewsModel) -> ()) {
        request(url: "\(URLs.news)\(API_KEYS.NEWS_API_KEY)") { data in
            let news = try! JSONDecoder().decode(NewsModel.self, from: data!)
            
            DispatchQueue.main.async {
                completion(news)
            }
        }
    }
    
    // country
    func getCountry(country: String, completion: @escaping (CountryModel) -> ()) {
        let grp = DispatchGroup()
        var countryRes: Country?
        var vaccineRes: Vaccine?
        
        grp.enter()
        request(url: "\(URLs.countries)\(country)") { countryData in
            let country = try! JSONDecoder().decode(Country.self, from: countryData!)
            countryRes = country
            grp.leave()
        }
        
        grp.enter()
        request(url: "\(URLs.vaccines)\(country)") { vaccineData in
            let vaccine = try! JSONDecoder().decode(Vaccine.self, from: vaccineData!)
            vaccineRes = vaccine
            grp.leave()
        }
        
        grp.notify(queue: DispatchQueue.main) {
            if countryRes != nil && vaccineRes != nil {
                completion(CountryModel(country: countryRes!, moreData: vaccineRes!))
            }
        }
    }
    
    // state
    func getState(state: String, completion: @escaping (USState) -> ()) {
        request(url: "\(URLs.states)\(state)") { data in
            let state = try! JSONDecoder().decode(USState.self, from: data!)
            completion(state)
        }
    }
    
    // world
    func getWorld(completion: @escaping (World) -> ()) {
        request(url: URLs.world) { data in
            let world = try! JSONDecoder().decode(World.self, from: data!)
            completion(world)
        }
    }
    
    // continents
    func getContinents(completion: @escaping ([Continent]) -> ()) {
        request(url: URLs.continents) { data in
            let continents = try! JSONDecoder().decode([Continent].self, from: data!)
            completion(continents)
        }
    }
}
