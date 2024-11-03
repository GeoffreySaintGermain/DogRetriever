//
//  NetworkService.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

protocol NetworkService {
    func request<D: Decodable>(from endpoint: Endpoint) async throws -> D
}

final class DefaultNetworkService: NetworkService {
    
    typealias NetworkResponse = (data: Data, response: URLResponse)
        
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private let cache: URLCache
    private let session: URLSession
    private let cacheSize: Int = 150 * 1024 * 1024 // 150 mb
    
    private let logger: NetworkLogger
    
    init(logger: NetworkLogger) {
        self.logger = logger
        
        let config = URLSessionConfiguration.default
        cache = URLCache(memoryCapacity: cacheSize, diskCapacity: cacheSize)
        config.urlCache = cache
        config.requestCachePolicy = .useProtocolCachePolicy
        config.httpMaximumConnectionsPerHost = 5

        session = URLSession(configuration: config)
    }
    
    func request<D: Decodable>(from endpoint: Endpoint) async throws -> D {
        var dataRequested: Data? = nil
                
        let request = try endpoint.createRequest()
        logger.log(request: request)
        
        
        if let url = request.url {
            dataRequested = cachedRequest(with: url)
        }
        
        if dataRequested == nil {
            let networkResponse = try await sendRequest(request: request)
            logger.log(responseData: networkResponse.data, response: networkResponse.response)
            dataRequested = networkResponse.data
        }
        
        guard let dataRequested else {
            throw NetworkError.noData
        }
                
        return try decoder.decode(D.self, from: dataRequested)
    }
    
    private func cachedRequest(with url: URL) -> Data? {
        let request = URLRequest(url: url)
        let data = cache.cachedResponse(for: request)?.data
        return data
    }
    
    private func sendRequest(request: URLRequest) async throws -> NetworkResponse {
        do {
            return try await session.data(for: request)
        } catch let error as NSError {
            var message: String? = nil
            if let data = error.userInfo["data"] as? Data {
                message = try? decoder.decode(String.self, from: data)
            }
            throw NetworkError.error(statusCode: error.code, message: message)
        }
    }

}
