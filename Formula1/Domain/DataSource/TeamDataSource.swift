//
//  TeamsDataSource.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/12/25.
//
protocol TeamDataSource {
    
    func getTeams() async throws -> [Team]
}
