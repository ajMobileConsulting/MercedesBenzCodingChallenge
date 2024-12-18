//
//  Decoder.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import Foundation

import Foundation

protocol Decoder {
    func decode<T: Decodable>(type: T.Type, data: Data) throws -> T
}

extension Decoder {
    func decode<T>(type: T.Type, data: Data) throws -> T where T : Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(type.self, from: data)
    }
}
