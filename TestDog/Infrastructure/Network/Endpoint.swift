//
//  Endpoint.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

enum HTTPMethodType: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

struct Endpoint {
    let path: String
    let method: HTTPMethodType
    let headerParameters: [String: String]
    let queryParameters: [String: Any]
    let bodyParameters: [String: Any]
    let bodyParametersEncodable: Encodable?
    let bodyEncoder: BodyEncoder
    
    let apiConfiguration = ApiConfiguration()
    
    init(path: String,
         method: HTTPMethodType,
         headerParameters: [String: String] = [:],
         queryParameters: [String: Any] = [:],
         bodyParameters: [String: Any] = [:],
         bodyParametersEncodable: Encodable? = nil,
         bodyEncoder: BodyEncoder = JSONBodyEncoder()) {
        self.path = path
        self.method = method
        self.headerParameters = headerParameters
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.bodyParametersEncodable = bodyParametersEncodable
        self.bodyEncoder = bodyEncoder
    }
}

extension Endpoint {
    
    func createRequest() throws -> URLRequest {
        let url = try createUrl()
        
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = method.rawValue
        
        urlRequest.allHTTPHeaderFields = headerParameters
        genericHeaders().forEach { header in
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if let bodyParametersEncodable {
            urlRequest.httpBody = try JSONEncoder().encode(bodyParametersEncodable)
        }

        return urlRequest
    }
    
    private func createUrl() throws -> URL {
        guard let urlPath = URL(string: apiConfiguration.baseURL.appending(path)),
            var urlComponents = URLComponents(string: urlPath.absoluteString) else {
            throw NetworkError.malformedURL
        }
        
        var urlQueryItems: [URLQueryItem] = []
        queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
        }
        
        urlComponents.queryItems = urlQueryItems.isEmpty ? nil : urlQueryItems

        guard let url = urlComponents.url else {
            throw NetworkError.malformedQuerry
        }
        
        return url
    }
    
    private func genericHeaders() -> [String: String] {
        return [
            "Content-Type": "application/json",
            "x-api-key": apiConfiguration.apiKey,
            "Accept": "application/json"
        ]
    }
}

protocol BodyEncoder {
    func encode(_ parameters: [String: Any]) -> Data?
}

struct JSONBodyEncoder: BodyEncoder {
    func encode(_ parameters: [String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: parameters)
    }
}
