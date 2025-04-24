//
//  DriverRepositoryImpl.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//
import Combine

struct DriverRepositoryImpl: DriversRepository {
    var dataSource: DriversDataSource
    
    func getDrivers() -> AnyPublisher<[Driver], Error>  {
        return dataSource.getDrivers()
    }
    
    func getDriver(name: String) -> AnyPublisher<Driver, any Error> {
        return dataSource.getDriver(name: name)
    }
}
