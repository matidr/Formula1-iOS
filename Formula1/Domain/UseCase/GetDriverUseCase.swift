//
//  GetDriverUseCase.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/23/25.
//
import Combine

struct GetDriverUseCase {
    var repo: DriversRepository
    
    func getDriver(name: String) async throws -> Driver {
        return try await repo.getDriver(name: name)
    }
}
