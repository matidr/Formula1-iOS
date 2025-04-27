//
//  DriverDto.swift
//  SwiftUITest
//
//  Created by Matias Di Russo on 4/20/25.
//
struct DriverDto: Decodable {
    var documentId: String?
    var driverNumber: Int?
    var name: String?
    var image: String?
    var teamColor: String?
    var teamName: String?
    var nameAcronym: String?
}
