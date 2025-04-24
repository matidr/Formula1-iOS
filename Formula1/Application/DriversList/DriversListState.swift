//
//  State.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

enum DriversListState {
    case loading
    case loaded(drivers: [Driver], title: String)
    case error(reason: String)
}
