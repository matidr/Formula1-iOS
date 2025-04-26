//
//  GetDriverUseCase.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/23/25.
//
import Combine

struct GetDriverUseCase {
    var repo: DriversRepository
    
    func getDriver(driverNumber: Int, name: String) async throws -> Driver {
        return try await repo.getDriver(driverNumber: driverNumber, name: name)
    }
}
