//
//  DogDTO+Fake.swift
//  TestDogTests
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

@testable import TestDog

extension DogDTO {
    static func fake() -> DogDTO {
        DogDTO(breeds: [], id: "a", url: "a", width: nil, height: nil)
    }
}
