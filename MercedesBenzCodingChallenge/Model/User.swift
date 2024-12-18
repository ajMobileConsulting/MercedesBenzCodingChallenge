//
//  User.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/16/24.
//

import Foundation

struct User: Decodable {
    let login: String
    let id: Int
    let avatarUrl: String
}
