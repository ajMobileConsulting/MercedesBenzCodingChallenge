//
//  MockJSONManager.swift
//  MercedesBenzCodingChallengeTests
//
//  Created by Alexander Jackson on 12/18/24.
//

import XCTest
@testable import MercedesBenzCodingChallenge

class MockJSONManager: NetworkAction, Decoder {
    func get(apiURL: String, completion: @escaping (Result<Data, MercedesBenzCodingChallenge.NetworkError>) -> Void) {
        guard let url = getMockDataURL(jsonName: apiURL) else { return }
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(NetworkError.urlError))
        }
    }
    
    private func getMockDataURL(jsonName: String) -> URL? {
        guard let filepath = Bundle.main.path(forResource: jsonName, ofType: "json") else {
            return nil
        }
        let url = URL(fileURLWithPath: filepath)
        return url
    }
}
