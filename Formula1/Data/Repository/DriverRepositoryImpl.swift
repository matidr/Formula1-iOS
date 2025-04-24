//
//  DriverRepositoryImpl.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//
import Combine

struct DriverRepositoryImpl: DriversRepository {
    var dataSource: DriversDataSource
    
    func getDrivers() async throws -> [Driver]  {
        try await dataSource.getDrivers()
    }
    
    func getDriver(name: String) async throws -> Driver  {
        try await dataSource.getDriver(name: name)
    }
}
