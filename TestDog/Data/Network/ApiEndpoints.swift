//
//  ApiEndpoints.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

struct ApiEndpoints {
    
    // MARK: GET
    
    static func getBreeds(size: Int) -> Endpoint {
        return Endpoint(
            path: "/breeds",
            method: .get,
            queryParameters: [
                "limit": size,
                "has_breeds": 1
            ]
        )
    }
    
    static func getRandomImages(size: Int) -> Endpoint {
        return Endpoint(
            path: "/images/search",
            method: .get,
            queryParameters: [
                "limit": size,
                "has_breeds": 1
            ]
        )
    }
    
    static func getBreedsImages(size: Int, id: Int) -> Endpoint {
        return Endpoint(
            path: "/images/search",
            method: .get,
            queryParameters: [
                "limit": size,
                "breed_ids": id
            ]
        )
    }
    
}
