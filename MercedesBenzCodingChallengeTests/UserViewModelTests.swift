//
//  MercedesBenzCodingChallengeTests.swift
//  MercedesBenzCodingChallengeTests
//
//  Created by Alexander Jackson on 12/16/24.
//

import Foundation
import XCTest
@testable import MercedesBenzCodingChallenge

final class UserViewModelTest: XCTestCase {
    var viewModel: UserViewModel!
    var mockClient: UserRepositoryAction = MockUserRepository()
    override func setUp() {
        viewModel = UserViewModel(userClient: mockClient)
    }
  
    override func tearDown() {
        viewModel = nil
    }
    
    func test_get_users_success() {
        XCTAssertEqual(viewModel.users.count, 0)
        XCTAssertEqual(viewModel.viewStates, .empty)
        viewModel.getUsers(url: "mockUser")
        
        // state after calling getImages
        XCTAssertEqual(viewModel.users.count, 1)
        XCTAssertEqual(viewModel.users[0].login, "user.name")
        XCTAssertEqual(viewModel.users[0].id, 1)
        XCTAssertEqual(viewModel.users[0].avatarUrl, "image/url")
        XCTAssertEqual(viewModel.viewStates, .load)

        
    }
    
    func test_get_users_failure()  {
        XCTAssertEqual(viewModel.users.count, 0)
        XCTAssertEqual(viewModel.viewStates, .empty)
         viewModel.getUsers(url: "")

        
        // state after calling getImages
        XCTAssertEqual(viewModel.users.count, 0)
        XCTAssertEqual(viewModel.viewStates, .error(message: "The operation couldn’t be completed. (MercedesBenzCodingChallenge.NetworkError error 1.)"))

    }
    
    func test_get_user_image() async {
        let data = try? await viewModel.getImage(url: "mockImageURl", completion: { _ in
            
        })
        
        // state after calling getImage
        XCTAssertNotNil(data)
    }
}
