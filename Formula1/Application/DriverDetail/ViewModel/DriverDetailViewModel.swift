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
    
    func fetchDriver(name: String) async {
        do {
            let driver = try await driverUseCase.getDriver(name: name)
            DispatchQueue.main.async {
                self.state = .loaded(driver: driver)
            }
        } catch {
            self.state = .error(reason: error.localizedDescription)
        }
    }
    
    func resetForm() {
        self.state = .loading
    }
}
