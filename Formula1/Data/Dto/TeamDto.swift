//
//  TeamDto.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/12/25.
//

struct TeamDto: Decodable {
    var documentID: String?
    var name: String?
    var carImage: String?
    var teamLogo: String?
    var order: Int?
}
