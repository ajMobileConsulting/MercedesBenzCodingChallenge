//
//  MockProfileRepository.swift
//  MercedesBenzCodingChallengeTests
//
//  Created by Alexander Jackson on 12/18/24.
//

import Foundation
@testable import MercedesBenzCodingChallenge

final class MockProfileRepository: ProfileRepositoryContract {
    var shouldFail = false
    
    func getProfile(url: String, completion: @escaping (Result<MercedesBenzCodingChallenge.Profile, MercedesBenzCodingChallenge.NetworkError>) -> Void) {
        if shouldFail {
            completion(.failure(NetworkError.urlError))
        } else {
            completion(.success(Profile.profile))
        }
    }
    
    func getProfileImage(imageUrl: String, completion: @escaping (Result<Data, MercedesBenzCodingChallenge.NetworkError>) -> Void) {
        completion(.success(Data()))
    }
}
