//
//  ViewModelAssembly.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        MainActor.assumeIsolated {
            container.register(HomePageViewModel.self) { resolver in
                HomePageViewModel(dogUseCase: resolver.resolved(DogUseCase.self))
            }.inObjectScope(.container)
            
            container.register(BreedViewModel.self) { (resolver, breed: Breed) in
                BreedViewModel(breed: breed, dogUseCase: resolver.resolved(DogUseCase.self))
            }.inObjectScope(.transient)
        }
    }
}
