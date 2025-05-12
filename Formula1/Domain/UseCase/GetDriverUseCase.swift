//
//  GetDriverUseCase.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/23/25.
//
import Combine

struct GetDriverUseCase {
    var repo: DriverRepository
    
    func getDriver(driverId: String) async throws -> Driver {
        return try await repo.getDriver(driverId: driverId)
    }
}
