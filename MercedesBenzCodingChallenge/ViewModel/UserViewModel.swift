//
//  UserViewModel.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/16/24.
//

import Combine
import Foundation

class UserViewModel {
    private(set) var users: [User] = []
    @Published var viewStates: ViewStates = .empty
    private var userClient: UserRepositoryAction
    
    init(userClient: UserRepositoryAction = UserRepository()) {
        self.userClient = userClient
    }
    
    func getUsers(url: String) {
        viewStates = .loading
        userClient.getUser(url: url, completion: { [weak self] result in
             switch result {
             case .success(let users):
                 self?.users = users
                 self?.viewStates = .load
             case .failure(let error):
                 self?.viewStates = .error(message: error.localizedDescription)
             }
        })
    }
    
    @MainActor
    func getImage(url: String, completion: @escaping((Data?) -> Void)) {
        userClient.getUserImage(imageUrl: url){ result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                completion(nil)
            }
        }
    }
}
