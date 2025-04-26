//
//  DriverDetailDto.swift
//  Formula1
//
//  Created by Matias Di Russo on 4/25/25.
//
struct DriverDetailDto: Decodable {
    
    var country: CountryDto?
    var birthDate: String?
    var worldChampionships: Int?
    var races: Int?
    var podiums: Int?
    var carreerPoints: String?
    var teams: [TeamWrapperDto]?
    
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case birthDate = "birthdate"
        case worldChampionships = "world_championships"
        case races = "grands_prix_entered"
        case podiums = "podiums"
        case carreerPoints = "career_points"
        case teams = "teams"
    }
}

struct CountryDto: Decodable {
    var name: String
    var code: String
}
