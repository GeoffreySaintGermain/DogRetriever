//
//  Dog+Fake.swift
//  TestDogTests
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

@testable import TestDog

extension Dog {
    
    static func fake() -> Dog {
        Dog(id: "a", name: "a", url: "a")
    }
}
