//
//  GenericResponse.swift
//  Formula1
//
//  Created by Matias Di Russo on 4/25/25.
//

struct GenericResponse<T: Decodable>: Decodable {
    var response: T
}
