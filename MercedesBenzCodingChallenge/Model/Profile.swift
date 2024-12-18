//
//  Profile.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import Foundation

struct Profile: Decodable {
    let id: Int
    let avatarUrl: String
    let name: String
    let company: String
    let location: String
    let followers: Int
    let following: Int
}
