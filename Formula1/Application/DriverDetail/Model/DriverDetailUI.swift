//
//  DriverDetailUI.swift
//  Formula1
//
//  Created by Matias Di Russo on 4/28/25.
//
import Foundation

struct DriverDetailUI {
    var id: String
    var driverNumber: Int
    var countryImage: URL?
    var helmetImage: URL?
    var name: String
    var heroImage: URL?
    var teamImage: URL?
    var bio: String?
    var worldChampionships: Int?
    var totalRaces: Int?
    var podiums: Int?
    var totalPoints: String?
    var overrideTeamLogoColor: Bool
    var teamColor: String
    var teamName: String
}

extension Driver {
    func toDetailUI() -> DriverDetailUI {
        DriverDetailUI(id: id, driverNumber: driverNumber, countryImage: countryImageURL, helmetImage: helmetImageURL, name: "\(name) \(lastName)", heroImage: driverHeroImage, teamImage: teamLogo, bio: bio, worldChampionships: worldChampionships, totalRaces: races, podiums: podiums, totalPoints: carreerPoints, overrideTeamLogoColor: overrideTeamLogoColor, teamColor: teamColor, teamName: teamName)
    }
}
