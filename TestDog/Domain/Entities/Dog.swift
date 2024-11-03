//
//  Dog.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

struct Dog: Identifiable, Hashable {
    let id: String
    let name: String?
    let url: String?
}

extension Dog {
    static func fromDTO(_ dto: DogDTO) -> Dog {
        Dog(id: dto.id, name: dto.breeds?.first?.name, url: dto.url)
    }
    
    static func fromDTO(_ dtos: [DogDTO]) -> [Dog] {
        var dogs: [Dog] = []
        
        dtos.forEach { dto in
            dogs.append(Dog.fromDTO(dto))
        }
        
        return dogs
    }
}
