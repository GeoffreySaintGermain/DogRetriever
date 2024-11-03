//
//  MockDogRepository.swift
//  TestDogTests
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

@testable import TestDog

class MockDogRepository: DogRepository {
    
    public var fakeDogDTO: [DogDTO] = []
    public var fakeBreedDTO: [BreedDTO] = []
    
    func fetchRandomImages(size: Int) async throws -> [TestDog.DogDTO] {
        return fakeDogDTO
    }
    
    func fetchBreeds(size: Int) async throws -> [TestDog.BreedDTO] {
        return fakeBreedDTO
    }
    
    func fetchBreedsImages(size: Int, id: Int) async throws -> [TestDog.DogDTO] {
        return fakeDogDTO
    }
    
}
