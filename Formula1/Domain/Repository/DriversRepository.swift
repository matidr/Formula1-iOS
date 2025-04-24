//
//  DriversRepository.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Combine

protocol DriversRepository {
    func getDrivers() -> AnyPublisher<[Driver], Error>
    func getDriver(name: String) -> AnyPublisher<Driver, Error>
}
