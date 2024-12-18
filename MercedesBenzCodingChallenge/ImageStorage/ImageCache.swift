//
//  ImageCache.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import Foundation

protocol ImageCacheActions {
    func saveImage(_ data: Data, url: String)
    func getImage(_ url: String)-> Data?
}

final class ImageCache {
    static let shared = ImageCache()
    private var imageData: [String: Data] = [:]
    private init() {}
}

extension ImageCache: ImageCacheActions {
    func saveImage(_ data: Data, url: String) {
        imageData[url] = data
    }
    
    func getImage(_ url: String) -> Data? {
        return imageData[url]
    }
}
