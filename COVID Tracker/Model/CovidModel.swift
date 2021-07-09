import Foundation

// VACCINE
struct Vaccine: Codable {
    let All: VaccineData
}

struct VaccineData: Codable {
    let administered: Int
    let people_vaccinated: Int
    let people_partially_vaccinated: Int
    let population: Int
    let life_expectancy: String
    let capital_city: String
}

// COUNTRY
struct Country: Codable {
    let updated: Int
    let country: String
    let countryInfo: CountryInfo
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let active: Int
    let critical: Int
    let casesPerOneMillion: Int
    let deathsPerOneMillion: Int
    let tests: Int
    let testsPerOneMillion: Int
}

struct CountryInfo: Codable {
    let iso2: String
}

// STATE
struct USState: Codable {
    let state: String
    let updated: Int
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let active: Int
    let casesPerOneMillion: Int
    let deathsPerOneMillion: Int
    let tests: Int
    let testsPerOneMillion: Int
    let population: Int
}

// WORLD
struct World: Codable {
    let updated: Int
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let active: Int
    let critical: Int
    let casesPerOneMillion: Int
    let deathsPerOneMillion: Int
    let tests: Int
    let testsPerOneMillion: Int
    let affectedCountries: Int
}

// CONTINENT
struct Continent: Codable {
    let updated: Int
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let active: Int
    let critical: Int
    let continent: String
}
