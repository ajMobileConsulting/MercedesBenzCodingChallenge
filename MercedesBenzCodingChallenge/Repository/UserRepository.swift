//
//  UserNetworkManager.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import Foundation

protocol UserRepositoryAction {
    func getUser(url: String, completion: @escaping (Result<[User], NetworkError>) -> Void)
    func getUserImage(imageUrl: String, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

final class UserRepository: UserRepositoryAction, Decoder {
    private let serviceManager: NetworkAction
    private var imageCache: ImageCache
    init(serviceManager: NetworkAction = NetworkManager(), imageCache: ImageCache = ImageCache.shared) {
        self.serviceManager = serviceManager
        self.imageCache = imageCache
    }
    
    func getUser(url: String, completion: @escaping (Result<[User], NetworkError>) -> Void) {
        serviceManager.get(apiURL: url) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    if let user = try self?.decode(type: [User].self, data: data) {
                        completion(.success(user))
                    }
                }catch {
                    completion(.failure(NetworkError.parsingFailed))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getUserImage(imageUrl: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
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
