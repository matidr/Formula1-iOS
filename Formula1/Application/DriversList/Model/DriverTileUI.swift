//
//  DriverTileUI.swift
//  Formula1
//
//  Created by Matias Di Russo on 4/28/25.
//
import Foundation

struct DriverTileUI: Identifiable {
    var id: String
    var name: String
    var lastName: String
    var teamName: String
    var countryImage: URL?
    var driverImage: URL?
    var driverNumberImage: URL?
    var teamColor: String
}

extension Driver {
    func toTileUI() -> DriverTileUI {
        let driver = self
        return DriverTileUI(id: driver.id, name: driver.name, lastName: driver.lastName, teamName: driver.teamName, countryImage: driver.countryImageURL, driverImage: driver.driverImageURL, driverNumberImage: driver.driverNumberImage, teamColor: driver.teamColor)
    }
}
