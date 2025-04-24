//
//  ViewModel.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Foundation
import Combine

@MainActor class DriversListViewModel: ObservableObject {
    
    @Published var state: DriversListState = .loading
    
    var driversUseCases = GetDriversListUseCase(repo: DriverRepositoryImpl(dataSource: DriverRemoteDataSourceImpl()))
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchDrivers() async {
        do {
            let drivers = try await driversUseCases.getDrivers()
            DispatchQueue.main.async {
                self.state = .loaded(drivers: drivers, title: "Formula 1 Drivers")
            }
        } catch {
            self.state = .error(reason: error.localizedDescription)
        }
    }
    
    func resetForm() {
        self.state = .loading
    }
}
