//
//  ProfileViewModelTests.swift
//  MercedesBenzCodingChallengeTests
//
//  Created by Alexander Jackson on 12/18/24.
//

import XCTest
@testable import MercedesBenzCodingChallenge

final class ProfileViewModelTest: XCTestCase {
    var sut: ProfileViewModel!
    let networkManager = MockProfileRepository()
    
    override func setUp() {
        sut = ProfileViewModel(id: 1, profileClient: networkManager)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_get_profile_success()  {
        XCTAssertNil(sut.profile)
        
         sut.getProfile()
        XCTAssertNotNil(sut.profile)
    }
    
    func test_get_profile_failure()  {
        XCTAssertNil(sut.profile)
        networkManager.shouldFail = true
         sut.getProfile()
        XCTAssertNil(sut.profile)
    }
    
    
    func test_get_user_image() {
        sut.getImage(url: "mockImageURl", completion: { data in
            // state after calling getImage
            XCTAssertNotNil(data)
        })
        
    }
}
