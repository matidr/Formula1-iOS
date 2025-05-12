//
//  TeamListView.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/5/25.
//
import SwiftUI

struct TeamListView: View {
    
    @StateObject var vm = TeamsListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                switch vm.state {
                case .loading:
                    LoadingView()
                    
                case .loaded(let teams, let title):
                    TeamsListSuccessView(title: title, teams: teams)
                    
                case .error(reason: let reason):
                    ErrorView(reason: reason)
                    
                }
            }.background(.black).task {
                await vm.fetchTeams()
            }
        }
    }
}

#Preview {
    TeamListView()
}
