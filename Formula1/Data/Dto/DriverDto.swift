//
//  DriverDto.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//
struct DriverDto: Decodable {
    var id: Int?
    var name: String?
    var image: String?
    var teamColor: String?
    var teamName: String?
    var nameAcronym: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "driver_number"
        case name = "full_name"
        case image = "headshot_url"
        case teamColor = "team_colour"
        case teamName = "team_name"
        case nameAcronym = "name_acronym"
    }
}
