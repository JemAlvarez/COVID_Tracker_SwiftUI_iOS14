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
            do {
                let news = try JSONDecoder().decode(NewsModel.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(news)
                }
            } catch {
                print(error)
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
            do {
                let country = try JSONDecoder().decode(Country.self, from: countryData!)
                countryRes = country
            } catch {
                print(error)
            }
            grp.leave()
        }
        
        grp.enter()
        request(url: "\(URLs.vaccines)\(country)") { vaccineData in
            do {
                let vaccine = try JSONDecoder().decode(Vaccine.self, from: vaccineData!)
                vaccineRes = vaccine
            } catch {
                print(error)
            }
            grp.leave()
        }
        
        grp.notify(queue: DispatchQueue.main) {
            completion(CountryModel(country: countryRes, moreData: vaccineRes, flag: CountriesInfo.shared.getCountryFalg(country)))
        }
    }
    
    // state
    func getState(state: String, completion: @escaping (USState?) -> ()) {
        request(url: "\(URLs.states)\(state)") { data in
            do {
                let state = try JSONDecoder().decode(USState.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(state)
                }
            } catch {
                completion(nil)
                print(error)
            }
        }
    }
    
    // world
    func getWorld(completion: @escaping (World) -> ()) {
        request(url: URLs.world) { data in
            let world = try! JSONDecoder().decode(World.self, from: data!)
            
            DispatchQueue.main.async {
                completion(world)
            }
        }
    }
    
    // continents
    func getContinents(completion: @escaping ([Continent]) -> ()) {
        request(url: URLs.continents) { data in
            let continents = try! JSONDecoder().decode([Continent].self, from: data!)
            
            DispatchQueue.main.async {
                completion(continents)
            }
        }
    }
}
