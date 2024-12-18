//
//  MockUserRepository.swift
//  MercedesBenzCodingChallengeTests
//
//  Created by Alexander Jackson on 12/18/24.
//

import Foundation
@testable import MercedesBenzCodingChallenge

final class MockUserRepository: UserRepositoryAction {
    func getUser(url: String, completion: @escaping (Result<[MercedesBenzCodingChallenge.User], MercedesBenzCodingChallenge.NetworkError>) -> Void) {
        if url.isEmpty {
            completion(.failure(NetworkError.urlError))
        } else {
            completion(.success(User.user))
        }
    }
    
    func getUserImage(imageUrl: String, completion: @escaping (Result<Data, MercedesBenzCodingChallenge.NetworkError>) -> Void) {
        completion(.success(Data()))
    }

}
