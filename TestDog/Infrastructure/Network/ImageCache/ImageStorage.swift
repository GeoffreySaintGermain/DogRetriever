//
//  ImageStorage.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 30/10/2024.
//

import Combine
import Foundation
import SwiftUI

public protocol ImageStorage: AnyObject {
    func getImage(for url: URL) -> AnyPublisher<UIImage?, Error>
    func cachedImage(with url: URL) -> UIImage?
    func clearStorage()
}

final class ImageURLStorage: ImageStorage {
    static let shared: ImageStorage = ImageURLStorage()

    private let cache: URLCache
    private let session: URLSession
    private let cacheSize: Int = 150 * 1024 * 1024 // 150 mb

    private init() {
        let config = URLSessionConfiguration.default
        cache = URLCache(memoryCapacity: cacheSize, diskCapacity: cacheSize)
        config.urlCache = cache
        config.requestCachePolicy = .useProtocolCachePolicy
        config.httpMaximumConnectionsPerHost = 5

        session = URLSession(configuration: config)
    }

    func getImage(for url: URL) -> AnyPublisher<UIImage?, Error> {
        latestData(with: url)
            .map(UIImage.init)
            .eraseToAnyPublisher()
    }

    func cachedImage(with url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        let data = cache.cachedResponse(for: request)?.data
        return data.flatMap(UIImage.init)
    }

    func clearStorage() {
        cache.removeAllCachedResponses()
    }
}

extension ImageURLStorage {
    private func latestData(with url: URL)  -> AnyPublisher<Data, Error> {
        let request = URLRequest(url: url)

        return session
            .dataTaskPublisher(for: request)
            .map(\.data)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
