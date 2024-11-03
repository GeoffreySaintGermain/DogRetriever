//
//  TestDogUseCase.swift
//  TestDogUseCase
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import XCTest
@testable import TestDog

final class TestDogUseCase: XCTestCase {

    private var dogUseCase: DefaultDogUseCase!
    private var mockDogRepository: MockDogRepository!
    
    override func setUpWithError() throws {
        mockDogRepository = MockDogRepository()
        dogUseCase = DefaultDogUseCase(dogRepository: mockDogRepository)
    }

    override func tearDownWithError() throws {}
    
    func testFetchRandomImagesData() async throws {
        let fakeDogDTO = DogDTO.fake()
        
        // Given
        mockDogRepository.fakeDogDTO = [fakeDogDTO]
        
        // When
        let response = try await dogUseCase.fetchRandomImages(size: 1)
        
        // Then
        let dog = response.first
        XCTAssertEqual(response.count, 1)
        XCTAssertEqual(dog!.id, fakeDogDTO.id)
        XCTAssertEqual(dog?.name, fakeDogDTO.breeds?.first?.name)
        XCTAssertEqual(dog!.url, fakeDogDTO.url)
    }
    
    func testFetchBreeds() async throws {
        let fakeBreedDTO = BreedDTO.fake()
        
        // Given
        mockDogRepository.fakeBreedDTO = [fakeBreedDTO]
        
        // When
        let response = try await dogUseCase.fetchBreeds()
        
        // Then
        let breed = response.first
        XCTAssertEqual(response.count, 1)
        XCTAssertEqual(breed?.id, fakeBreedDTO.id)
        XCTAssertEqual(breed?.name, fakeBreedDTO.name)
        XCTAssertEqual(breed?.bredFor, fakeBreedDTO.bred_for)
        XCTAssertEqual(breed?.lifeSpan, fakeBreedDTO.life_span)
        XCTAssertEqual(breed?.origin, fakeBreedDTO.origin)
        XCTAssertEqual(breed?.temperament, fakeBreedDTO.temperament)
        XCTAssertEqual(breed?.breedGroup, fakeBreedDTO.breed_group)
    }
    
    func testFetchBreedsImages() async throws {
        let fakeDogDTO = DogDTO.fake()
        
        // Given
        mockDogRepository.fakeDogDTO = [fakeDogDTO]
        
        // When
        let response = try await dogUseCase.fetchBreedsImages(size: 1, id: 1)
        
        // Then
        let dog = response.first
        XCTAssertEqual(response.count, 1)
        XCTAssertEqual(dog!.id, fakeDogDTO.id)
        XCTAssertEqual(dog?.name, fakeDogDTO.breeds?.first?.name)
        XCTAssertEqual(dog!.url, fakeDogDTO.url)
    }

}
