//
//  TeamsRepository.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/12/25.
//
import Combine

protocol TeamRepository {
    func getTeams() async throws -> [Team]
}
