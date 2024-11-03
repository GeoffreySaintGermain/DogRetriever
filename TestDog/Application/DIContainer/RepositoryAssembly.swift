//
//  RepositoryAssembly.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Swinject

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DogRepository.self) { resolver in
            DefaultDogRepository(networkService: resolver.resolved(NetworkService.self))
        }.inObjectScope(.weak)
    }
}
