//
//  NetworkErrors.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case urlError
    case serverNotFoundError
    case dataNotFound
    case parsingFailed
}
