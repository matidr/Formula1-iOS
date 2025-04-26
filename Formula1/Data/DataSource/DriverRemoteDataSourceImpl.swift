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
        return try await makeDriversCall(driverNumber: nil)
    }
    
    func getDriver(driverNumber: Int, name: String) async throws -> Driver {
        async let basicDriverInfo = makeDriversCall(driverNumber: driverNumber).first
        async let extraDriverInfo = makeDriverExtraInfoCall(name: name)
        guard var driver = try await basicDriverInfo else { throw SimpleError.wrongInfo }
        guard let extraDriverInfoResponse = try await extraDriverInfo else { throw SimpleError.wrongInfo }
        driver.birthDate = extraDriverInfoResponse.birthDate
        driver.carreerPoints = extraDriverInfoResponse.carreerPoints
        driver.countryName = extraDriverInfoResponse.country.name
        driver.countryCode = extraDriverInfoResponse.country.code
        driver.podiums = extraDriverInfoResponse.podiums
        driver.races = extraDriverInfoResponse.races
        driver.worldChampionships = extraDriverInfoResponse.worldChampionships

        return driver
    }
    
    private func makeDriverExtraInfoCall(name: String) async throws -> DriverDetailDto? {
        guard let url = URL(string: "https://api-formula-1.p.rapidapi.com/drivers?name=\(name)") else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("PASTE-API-KEY-HERE", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("api-formula-1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedData = try JSONDecoder().decode(GenericResponse<[DriverDetailDto]>.self, from: data)
        return decodedData.response.first
    }
    
    private func makeDriversCall(driverNumber: Int?) async throws -> [Driver] {
        guard let url = URL(string: "https://api.openf1.org/v1/drivers?session_key=10022" + (driverNumber.map { "&driver_number=\($0)" } ?? "")) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
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
    
    enum SimpleError: Error {
        case notImplemented
        case wrongInfo
    }
}
