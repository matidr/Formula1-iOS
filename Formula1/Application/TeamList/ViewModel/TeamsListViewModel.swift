//
//  ViewModel.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Foundation
import Combine

@MainActor class TeamsListViewModel: ObservableObject {
    
    @Published var state: TeamsListState = .loading
    
    var teamsUseCases = GetTeamsListUseCase(repo: TeamRepositoryImpl(dataSource: TeamRemoteDataSourceImpl()))
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchTeams() async {
        do {
            let teams = try await teamsUseCases.getTeams().map { team in
                team.toTileUI()
            }
            DispatchQueue.main.async {
                self.state = .loaded(teams: teams, title: "Formula 1 Teams")
            }
        } catch {
            self.state = .error(reason: error.localizedDescription)
        }
    }
    
    func resetForm() {
        self.state = .loading
    }
}
