//
//  MockNetworkManager.swift
//  MercedesBenzCodingChallengeTests
//
//  Created by Alexander Jackson on 12/18/24.
//

import XCTest
@testable import MercedesBenzCodingChallenge

class MockNetworkManager: NetworkAction {
    
    func get(apiURL: String, completion: @escaping (Result<Data, MercedesBenzCodingChallenge.NetworkError>) -> Void) {
        if apiURL.isEmpty {
            completion(.failure(NetworkError.urlError))
        } else {
            MockJSONManager().get(apiURL: apiURL) { result in
                switch result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

extension User {
    static var user: [User] {
        return [User(
            login: "user.name",
            id: 1,
            avatarUrl: "image/url"
        )]
    }
}

extension Profile {
    static var profile: Profile {
        return Profile(
            id: 1,
            avatarUrl: "image/url",
            name: "test",
            company: "test",
            location: "test",
            followers: 2,
            following: 3
        )
    }
}
