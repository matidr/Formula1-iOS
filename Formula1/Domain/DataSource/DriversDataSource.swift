//
//  DriversDataSource.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/21/25.
//
import Combine

protocol DriversDataSource {
    func getDrivers() async throws -> [Driver]
    func getDriver(driverNumber: Int, name: String) async throws -> Driver
}
