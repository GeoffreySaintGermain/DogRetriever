//
//  DogDTO.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

struct DogDTO: Codable {
    let breeds: [BreedDTO]?
    let id: String
    let url: String?
    let width: Int?
    let height: Int?
}
