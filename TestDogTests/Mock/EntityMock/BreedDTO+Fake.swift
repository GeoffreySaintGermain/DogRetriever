//
//  BreedDTO+Fake.swift
//  TestDogTests
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

@testable import TestDog

extension BreedDTO {
    static func fake() -> BreedDTO {
        BreedDTO(weight: nil, height: nil, id: 1, name: "a", bred_for: "a", breed_group: "a", life_span: "a", temperament: "a", reference_image_id: "a", origin: "a", image: nil)
    }
}
