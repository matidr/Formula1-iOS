//
//  GetDriverUseCase.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/23/25.
//
import Combine

struct GetDriverUseCase {
    var repo: DriversRepository
    
    func getDriver(name: String) -> AnyPublisher<Driver, Error> {
        return repo.getDriver(name: name)
    }
}
