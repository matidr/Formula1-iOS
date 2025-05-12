//
//  DriverRepositoryImpl.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//
import Combine

struct DriverRepositoryImpl: DriverRepository {
    var dataSource: DriverDataSource
    
    func getDrivers() async throws -> [Driver]  {
        try await dataSource.getDrivers()
    }
    
    func getDriver(driverId: String) async throws -> Driver  {
        try await dataSource.getDriver(driverId: driverId)
    }
}
