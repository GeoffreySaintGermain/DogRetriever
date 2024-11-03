//
//  MockNetworkService.swift
//  TestDogTests
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

@testable import TestDog

class MockNetworkService: NetworkService {
    
    var response: Any? = nil
    
    func request<D>(from endpoint: TestDog.Endpoint) async throws -> D where D : Decodable {
        return response as! D
    }
}
