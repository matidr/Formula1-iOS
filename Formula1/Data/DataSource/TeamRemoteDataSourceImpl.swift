//
//  TeamRemoteDataSourceImpl.swift
//  Formula1
//
//  Created by Matias Di Russo on 5/12/25.
//
import Foundation
import Combine
import FirebaseFirestore

struct TeamRemoteDataSourceImpl: TeamDataSource {
    let db = Firestore.firestore()
    
    func getTeams() async throws -> [Team] {
        do {
            let querySnapshot = try await db.collection("teams").getDocuments()
            let teams: [Team] = try querySnapshot.documents.map { document in
                var dto = try document.data(as: TeamDto.self)
                dto.documentID = document.documentID
                return dto
            }.sorted { guard let order0 = $0.order, let order1 = $1.order else {
                return $0.order != nil // Entries with non-nil order come first
            }
                return order0 < order1
            }.map { dto in
                return Team(id: dto.documentID ?? "", name: dto.name ?? "", logo: URL(string: dto.teamLogo ?? ""), carImage: URL(string: dto.carImage ?? ""))
            }
            return teams
        } catch {
            throw error
        }
    }
}
