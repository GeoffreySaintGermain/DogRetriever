//
//  UseCaseAssembly.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Swinject

class UseCaseAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(DogUseCase.self) { resolver in
            DefaultDogUseCase(dogRepository: resolver.resolved(DogRepository.self))
        }.inObjectScope(.weak)
    }
}
