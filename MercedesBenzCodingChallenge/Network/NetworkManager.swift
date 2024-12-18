//
//  NetworkManager.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/16/24.
//

import Foundation
import UIKit

protocol NetworkAction {
    func get(apiURL: String, completion: @escaping(Result<Data, NetworkError>)-> Void)
}


struct NetworkManager {
    private let urlSession: URLSession
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkManager: NetworkAction {
    func get(apiURL: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: apiURL) else {
            completion(.failure(NetworkError.urlError))
            return
        }
        urlSession.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil else {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
