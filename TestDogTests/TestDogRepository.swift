//
//  TestDogRepository.swift
//  TestDogTests
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

import XCTest
@testable import TestDog

final class TestDogRepository: XCTestCase {

    private var mockNetworkService: MockNetworkService!
    private var dogRepository: DogRepository!
    
    override func setUpWithError() throws {
        mockNetworkService = MockNetworkService()
        dogRepository = DefaultDogRepository(networkService: mockNetworkService)
    }

    override func tearDownWithError() throws {}
    
    func testFetchRandomImagesData() async throws {
        let fakeDogDTO = DogDTO.fake()
        
        // Given
        mockNetworkService.response = [fakeDogDTO]
        
        // When
        let response = try await dogRepository.fetchRandomImages(size: 1)
        
        // Then
        let dog = response.first
        XCTAssertEqual(response.count, 1)
        XCTAssertEqual(dog?.id, fakeDogDTO.id)
        XCTAssertEqual(dog?.url, fakeDogDTO.url)
    }
    
    func testFetchBreeds() async throws {
        let fakeBreedDTO = BreedDTO.fake()
        
        // Given
        mockNetworkService.response = [fakeBreedDTO]
        
        // When
        let response = try await dogRepository.fetchBreeds(size: 1)
        
        // Then
        let breed = response.first
        XCTAssertEqual(response.count, 1)
        XCTAssertEqual(breed?.id, fakeBreedDTO.id)
        XCTAssertEqual(breed?.name, fakeBreedDTO.name)
        XCTAssertEqual(breed?.bred_for, fakeBreedDTO.bred_for)
        XCTAssertEqual(breed?.life_span, fakeBreedDTO.life_span)
        XCTAssertEqual(breed?.origin, fakeBreedDTO.origin)
        XCTAssertEqual(breed?.temperament, fakeBreedDTO.temperament)
        XCTAssertEqual(breed?.breed_group, fakeBreedDTO.breed_group)
    }
    
    func testFetchBreedsImages() async throws {
        let fakeDogDTO = DogDTO.fake()
        
        // Given
        mockNetworkService.response = [fakeDogDTO]
        
        // When
        let response = try await dogRepository.fetchBreedsImages(size: 1, id: 1)
        
        // Then
        let dog = response.first
        XCTAssertEqual(response.count, 1)
        XCTAssertEqual(dog?.id, fakeDogDTO.id)
        XCTAssertEqual(dog?.url, fakeDogDTO.url)
    }

}
