//
//  DriverCoreDataImpl.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//

import Foundation
import Combine
import FirebaseFirestore

struct DriverRemoteDataSourceImpl: DriversDataSource {
    let db = Firestore.firestore()
    
    func getDrivers() async throws -> [Driver] {
        do {
            let querySnapshot = try await db.collection("drivers").getDocuments()
            let drivers: [Driver] = try querySnapshot.documents.map { document in
                let dto = try document.data(as: DriverDto.self)
                return Driver(
                    id: dto.driverNumber ?? 0,
                    name: dto.name ?? "",
                    imageUrl: URL(string: dto.image ?? ""),
                    teamColor: dto.teamColor ?? "",
                    teamName: dto.teamName ?? "",
                    nameAcronym: dto.nameAcronym ?? ""
                )
            }
            return drivers
        } catch {
            throw error
        }
    }
    
    func getDriver(driverNumber: Int, name: String) async throws -> Driver {
        throw SimpleError.notImplemented
    }
    
    enum SimpleError: Error {
        case notImplemented
        case wrongInfo
    }
}
