//
//  DogRepository.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

protocol DogRepository {
    func fetchRandomImages(size: Int) async throws -> [DogDTO]
    func fetchBreeds(size: Int) async throws -> [BreedDTO]
    func fetchBreedsImages(size: Int, id: Int) async throws -> [DogDTO]
}

final class DefaultDogRepository: DogRepository {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchRandomImages(size: Int) async throws -> [DogDTO] {
        let endpoint = ApiEndpoints.getRandomImages(size: size)
        return try await networkService.request(from: endpoint)
    }
    
    func fetchBreeds(size: Int) async throws -> [BreedDTO] {
        let endpoint = ApiEndpoints.getBreeds(size: size)
        return try await networkService.request(from: endpoint)
    }
    
    func fetchBreedsImages(size: Int, id: Int) async throws -> [DogDTO] {
        let endpoint = ApiEndpoints.getBreedsImages(size: size, id: id)
        return try await networkService.request(from: endpoint)
    }
}
