//
//  Breed+Fake.swift
//  TestDogTests
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

@testable import TestDog

extension Breed {
    
    static func fake() -> Breed {
        Breed(weight: nil,
              height: nil,
              id: 1, 
              name: "a",
              bredFor: "a",
              breedGroup: "a",
              lifeSpan: "a",
              temperament: "a",
              origin: "a",
              imageUrl: "a")
    }
}
