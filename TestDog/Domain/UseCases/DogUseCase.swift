//
//  DogUseCase.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

protocol DogUseCase {
    func fetchRandomImages(size: Int) async throws -> [Dog]
    func fetchBreeds() async throws -> [Breed]
    func fetchBreedsImages(size: Int, id: Int) async throws -> [Dog]
}

class DefaultDogUseCase: DogUseCase {

    let dogRepository: DogRepository
    
    init(dogRepository: DogRepository) {
        self.dogRepository = dogRepository
    }
    
    func fetchRandomImages(size: Int) async throws -> [Dog] {
        let dogResponse = try await dogRepository.fetchRandomImages(size: size)
        return Dog.fromDTO(dogResponse)
    }
    
    func fetchBreeds() async throws -> [Breed] {
        let size = Int.max
        
        let breedResponse = try await dogRepository.fetchBreeds(size: size)
        return Breed.fromDTO(breedResponse)
    }
    
    func fetchBreedsImages(size: Int, id: Int) async throws -> [Dog] {
        let dogResponse = try await dogRepository.fetchBreedsImages(size: size, id: id)
        return Dog.fromDTO(dogResponse)
    }
    
}
