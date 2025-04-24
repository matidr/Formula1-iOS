//
//  DriverCoreDataImpl.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Foundation
import Combine

struct DriverRemoteDataSourceImpl: DriversDataSource {
    
    func getDrivers() -> AnyPublisher<[Driver], Error> {
        guard let url = URL(string: "https://api.openf1.org/v1/drivers?session_key=10022") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [DriverDto].self, decoder: JSONDecoder())
            .map { dtos in
                dtos.map { dto in
                    Driver(
                        id: dto.id ?? 0,
                        name: dto.name ?? "",
                        imageUrl: URL(string: dto.image ?? ""),
                        teamColor: dto.teamColor ?? "",
                        teamName: dto.teamName ?? "",
                        nameAcronym: dto.nameAcronym ?? ""
                    )
                }
            }
            .eraseToAnyPublisher()
    }
    
    func getDriver(name: String) -> AnyPublisher<Driver, any Error> {
        return Fail(error: SimpleError.notImplemented).eraseToAnyPublisher()
    }
    
    enum SimpleError: Error {
        case notImplemented
    }
}
