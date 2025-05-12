//
//  TeamListState.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/12/25.
//
enum TeamsListState {
    case loading
    case loaded(teams: [TeamTileUI], title: String)
    case error(reason: String)
}
