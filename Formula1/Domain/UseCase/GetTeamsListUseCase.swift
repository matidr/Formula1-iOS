//
//  GetTeamsListUseCase.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/12/25.
//
import Combine

struct GetTeamsListUseCase {
    var repo: TeamRepository
    
    func getTeams() async throws -> [Team] {
        return try await repo.getTeams()
    }
}
