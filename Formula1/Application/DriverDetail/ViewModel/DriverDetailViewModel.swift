//
//  DriverDetailViewModel.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/23/25.
//
import Foundation
import Combine

@MainActor class DriverDetailViewModel: ObservableObject {
    @Published var state: DriverDetailState = .loading
    
    var driverUseCase = GetDriverUseCase(repo: DriverRepositoryImpl(dataSource: DriverRemoteDataSourceImpl()))
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchDriver(name: String) {
        driverUseCase.getDriver(name: name)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.state = .error(reason: error.localizedDescription)
                }
            } receiveValue: { [weak self] driver in
                self?.state = .loaded(driver: driver)
            }
            .store(in: &cancellables)
    }
    
    func resetForm() {
        self.state = .loading
    }
}
