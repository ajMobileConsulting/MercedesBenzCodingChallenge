//
//  UserRepositoryTests.swift
//  MercedesBenzCodingChallengeTests
//
//  Created by Alexander Jackson on 12/18/24.
//

import Foundation
import XCTest
@testable import MercedesBenzCodingChallenge

class UserRepositoryTests: XCTestCase {
    var sut: UserRepository!
    var mockNetworkManager: NetworkAction!

    override func setUp() {
        mockNetworkManager = MockNetworkManager()
        sut = UserRepository(serviceManager: mockNetworkManager)
    }
    override func tearDown() {
        sut = nil
        mockNetworkManager = nil
    }
    
    func test_get_user_success() {
        
        sut.getUser(url: "mockUser", completion: { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user.count, 2)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func test_get_user_failure() {
        
        sut.getUser(url: "", completion: { result in
            switch result {
            case .success(let user):
                XCTAssertNil(user)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
}
