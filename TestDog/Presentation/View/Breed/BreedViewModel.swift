//
//  BreedViewModel.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

import Foundation

@MainActor
class BreedViewModel: ViewModel {
    
    @Published var dogs: [Dog] = []
    
    let breed: Breed
    let dogUseCase: DogUseCase
    
    init(breed: Breed, dogUseCase: DogUseCase) {
        self.breed = breed
        self.dogUseCase = dogUseCase
    }
    
    func fetchDogs() {
        Task {
            do {
                dogs = try await dogUseCase.fetchBreedsImages(size: 12, id: breed.id)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
