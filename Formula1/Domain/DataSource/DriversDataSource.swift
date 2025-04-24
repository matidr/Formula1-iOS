//
//  DriversDataSource.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/21/25.
//
import Combine

protocol DriversDataSource {
    func getDrivers() -> AnyPublisher<[Driver], Error>
    func getDriver(name: String) -> AnyPublisher<Driver, Error>
}
