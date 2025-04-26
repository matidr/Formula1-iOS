//
//  Driver.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Foundation

struct Driver: Identifiable {
    var id: Int
    var name: String
    var imageUrl: URL?
    var teamColor: String
    var teamName: String
    var nameAcronym: String
    var countryName: String?
    var countryCode: String?
    var birthDate: String?
    var worldChampionships: Int?
    var races: Int?
    var podiums: Int?
    var carreerPoints: String?
}
