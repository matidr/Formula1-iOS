//
//  DriversUseCases.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//
import Combine

struct GetDriversListUseCase {
    var repo: DriversRepository
    
    func getDrivers() async throws -> [Driver] {
        return try await repo.getDrivers()
    }
}
