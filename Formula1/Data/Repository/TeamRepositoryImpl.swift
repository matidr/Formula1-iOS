//
//  TeamsRepositoryImpl.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/12/25.
//
import Combine

struct TeamRepositoryImpl: TeamRepository {
    var dataSource: TeamDataSource
    
    func getTeams() async throws -> [Team]  {
        try await dataSource.getTeams()
    }
}
