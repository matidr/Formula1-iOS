//
//  DriverCoreDataImpl.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Foundation
import Combine

struct DriverRemoteDataSourceImpl: DriversDataSource {
    
    func getDrivers() async throws -> [Driver] {
        guard let url = URL(string: "https://api.openf1.org/v1/drivers?session_key=10022") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode([DriverDto].self, from: data)
        
        return decodedData.map { dto in
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
    
    func getDriver(name: String) async throws -> Driver {
        throw SimpleError.notImplemented
    }
    
    enum SimpleError: Error {
        case notImplemented
    }
}
