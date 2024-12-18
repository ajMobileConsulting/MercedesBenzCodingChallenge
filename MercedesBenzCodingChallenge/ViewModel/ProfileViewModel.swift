//
//  ProfileViewModel.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import Foundation

final class ProfileViewModel {
    private let id: Int
    private(set) var profile: Profile?
    @Published var viewStates: ViewStates = .empty
    private var profileClient: ProfileRepositoryContract
    
    init(id: Int,
         profileClient: ProfileRepositoryContract = ProfileRepository()) {
        self.profileClient = profileClient
        self.id = id
    }
    
    func getProfile() {
        let url = EndPoints.baseUrl + "/\(id)"
        viewStates = .loading
        profileClient.getProfile(url: url, completion: { [weak self] result in
             switch result {
             case .success(let profile):
                 self?.profile = profile
                 self?.viewStates = .load
             case .failure(let error):
                 self?.viewStates = .error(message: error.localizedDescription)
             }
        })
    }
    
    func getImage(url: String, completion: @escaping((Data?) -> Void))  {
        profileClient.getProfileImage(imageUrl: url){ result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                completion(nil)
            }
        }
    }
}
