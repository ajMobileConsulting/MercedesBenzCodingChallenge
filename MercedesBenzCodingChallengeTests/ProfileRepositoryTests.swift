//
//  ProfileRepositoryTests.swift
//  MercedesBenzCodingChallengeTests
//
//  Created by Alexander Jackson on 12/18/24.
//

import Foundation
import XCTest
@testable import MercedesBenzCodingChallenge

class ProfileRepositoryTests: XCTestCase {
    var sut: ProfileRepository!
    var mockNetworkManager: NetworkAction = MockNetworkManager()

    override func setUp() {
        sut = ProfileRepository(serviceManager: mockNetworkManager)
    }
    override func tearDown() {
        sut = nil
    }
    
    func test_get_profile_success()  {
        sut.getProfile(url: "mockProfile", completion: { result in
            switch result {
            case .success(let profile):
                XCTAssertNotNil(profile)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        })
    }
    
    func test_get_profile_failure()  {
        
        sut.getProfile(url: "", completion: { result in
            switch result {
            case .success(let profile):
                XCTAssertNil(profile)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        })
    }
    
}
