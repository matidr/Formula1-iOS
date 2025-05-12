//
//  TeamTileUI.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/12/25.
//
import Foundation

struct TeamTileUI: Identifiable {
    var id: String
    var name: String
    var teamLogoImage: URL?
    var teamCarImage: URL?
}

extension Team {
    func toTileUI() -> TeamTileUI {
        let team = self
        return TeamTileUI(id: team.id, name: team.name, teamLogoImage: team.logo, teamCarImage: team.carImage)
    }
}
