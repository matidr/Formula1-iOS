//
//  DriversRepository.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Combine

protocol DriversRepository {
    func getDrivers() async throws -> [Driver]
    func getDriver(driverNumber: Int, name: String) async throws -> Driver
}
