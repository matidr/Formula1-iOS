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
                var dto = try document.data(as: DriverDto.self)
                dto.documentID = document.documentID
                return dto
            }.sorted { guard let order0 = $0.order, let order1 = $1.order else {
                return $0.order != nil // Entries with non-nil order come first
            }
                return order0 < order1
            }.map { dto in
                return Driver(
                    id: dto.documentID ?? "",
                    driverNumber: dto.driverNumber ?? 0,
                    name: dto.name ?? "",
                    lastName: dto.lastName ?? "",
                    driverImageURL: URL(string: dto.driverImage ?? ""),
                    teamColor: dto.teamColor ?? "",
                    teamName: dto.teamName ?? "",
                    nameAcronym: dto.nameAcronym ?? "",
                    countryImageURL: URL(string: dto.countryImage ?? ""),
                    driverNumberImage: URL(string: dto.driverNumberImage ?? "")
                )
            }
            return drivers
        } catch {
            throw error
        }
    }
    
    func getDriver(driverId: String) async throws -> Driver {
        do {
            let querySnapshot = try await db.collection("drivers").document(driverId).getDocument()
            let dto = try querySnapshot.data(as: DriverDto.self)
            
            return Driver(
                id: dto.documentID ?? "",
                driverNumber: dto.driverNumber ?? 0,
                name: dto.name ?? "",
                lastName: dto.lastName ?? "",
                driverImageURL: URL(string: dto.driverImage ?? ""),
                teamColor: dto.teamColor ?? "",
                teamName: dto.teamName ?? "",
                nameAcronym: dto.nameAcronym ?? "",
                countryName: dto.country ?? "",
                worldChampionships: dto.worldChampionships ?? 0,
                races: dto.races ?? 0,
                podiums: dto.podiums ?? 0,
                carreerPoints: dto.carreerPoints ?? "",
                teamLogo: URL(string: dto.teamLogo ?? ""),
                helmetImageURL: URL(string: dto.helmetImage ?? ""),
                countryImageURL: URL(string: dto.countryImage ?? ""),
                bio: dto.bio ?? "",
                driverHeroImage: URL(string: dto.driverImageHero ?? ""),
                driverNumberImage: URL(string: dto.driverNumberImage ?? "")
            )
        } catch {
            throw error
        }
    }
    
    enum SimpleError: Error {
        case notImplemented
        case wrongInfo
    }
}
