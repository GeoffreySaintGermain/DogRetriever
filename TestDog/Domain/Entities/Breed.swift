//
//  Breed.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

import Foundation

struct Breed: Identifiable, Equatable, Hashable {
    
    let weight: Weight?
    let height: Height?
    let id: Int
    let name: String
    let bredFor: String?
    let breedGroup: String?
    let lifeSpan: String?
    let temperament: String?
    let origin: String?
    let imageUrl: String?
    
    static func == (lhs: Breed, rhs: Breed) -> Bool {
        lhs.id == rhs.id
    }
}

extension Breed {
    struct Weight: Hashable {
        let imperial: String?
        let metric: String?
    }
    
    struct Height: Hashable {
        let imperial: String?
        let metric: String?
    }
}

extension Breed {
    
    static func fromDTO(_ dto: BreedDTO) -> Breed {
        Breed(weight: Weight.fromDTO(dto.weight),
              height: Height.fromDTO(dto.height),
              id: dto.id,
              name: dto.name,
              bredFor: dto.bred_for,
              breedGroup: dto.bred_for,
              lifeSpan: dto.life_span,
              temperament: dto.temperament,
              origin: dto.origin,
              imageUrl:  dto.image?.url)
    }
    
    static func fromDTO(_ dtos: [BreedDTO]) -> [Breed] {
        var breeds: [Breed] = []
        
        dtos.forEach { dto in
            breeds.append(Breed.fromDTO(dto))
        }
        
        return breeds
    }
    
}

extension Breed.Weight {
    static func fromDTO(_ dto: WeightDTO?) -> Breed.Weight? {
        guard let dto else {
            return nil
        }
        
        return Breed.Weight(imperial: dto.imperial, metric: dto.metric)
    }
}

extension Breed.Height {
    static func fromDTO(_ dto: HeightDTO?) -> Breed.Height? {
        guard let dto else {
            return nil
        }
        
        return Breed.Height(imperial: dto.imperial, metric: dto.metric)
    }
}

