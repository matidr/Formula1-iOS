//
//  DriversDataSource.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/21/25.
//
import Combine

protocol DriverDataSource {
    func getDrivers() async throws -> [Driver]
    func getDriver(driverId: String) async throws -> Driver
}
