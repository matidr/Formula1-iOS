//
//  Driver.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Foundation

struct Driver: Identifiable {
    var id: String
    var driverNumber: Int
    var name: String
    var driverImageURL: URL?
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
    var teamLogo: String?
    var helmetImageURL: URL?
    var countryImageURL: URL?
}
