//
//  DogBreedDTO.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

import Foundation

struct BreedDTO: Codable {
    let weight: WeightDTO?
    let height: HeightDTO?
    let id: Int
    let name: String
    let bred_for: String?
    let breed_group: String?
    let life_span: String?
    let temperament: String?
    let reference_image_id: String?
    let origin: String?
    let image: ImageDTO?
}

struct WeightDTO: Codable {
    let imperial: String?
    let metric: String?
}

struct HeightDTO: Codable {
    let imperial: String?
    let metric: String?
}

struct ImageDTO: Codable {
    let id: String
    let width: Int?
    let height: Int?
    let url: String?
}
