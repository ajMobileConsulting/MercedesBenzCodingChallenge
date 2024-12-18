//
//  ProfileNetworkManager.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import Foundation

protocol ProfileRepositoryContract {
    func getProfile(url: String, completion: @escaping (Result<Profile, NetworkError>) -> Void)
    func getProfileImage(imageUrl: String, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

final class ProfileRepository: ProfileRepositoryContract, Decoder {
    private let serviceManager: NetworkAction
    private var imageCache: ImageCache
    init(serviceManager: NetworkAction = NetworkManager(), imageCache: ImageCache = ImageCache.shared) {
        self.serviceManager = serviceManager
        self.imageCache = imageCache
    }
    
    func getProfile(url: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
        serviceManager.get(apiURL: url) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    if let profile = try self?.decode(type: Profile.self, data: data) {
                        completion(.success(profile))
                    }
                }catch {
                    completion(.failure(NetworkError.parsingFailed))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getProfileImage(imageUrl: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        if let data = imageCache.getImage(imageUrl) {
            completion(.success(data))
        }
        serviceManager.get(apiURL: imageUrl) { [weak self] result in
            switch result {
            case .success(let data):
                self?.imageCache.saveImage(data, url: imageUrl)
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
