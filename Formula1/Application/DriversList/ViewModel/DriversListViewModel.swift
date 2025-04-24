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
    
    func fetchDrivers() {
        driversUseCases.getDrivers()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.state = .error(reason: error.localizedDescription)
                }
            } receiveValue: { [weak self] drivers in
                self?.state = .loaded(drivers: drivers, title: "Formula 1 Drivers")
            }
            .store(in: &cancellables)
    }
    
    func resetForm() {
        self.state = .loading
    }
}
