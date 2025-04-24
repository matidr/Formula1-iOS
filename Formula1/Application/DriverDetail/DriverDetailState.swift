//
//  State.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

enum DriverDetailState {
    case loading
    case loaded(driver: Driver)
    case error(reason: String)
}
