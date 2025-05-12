//
//  DriversRepository.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Combine

protocol DriverRepository {
    func getDrivers() async throws -> [Driver]
    func getDriver(driverId: String) async throws -> Driver
}
