//
//  HomePageViewModel.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

@MainActor
class HomePageViewModel: ViewModel {
    
    @Published var breeds: [Breed] = []
    
    private let dogUseCase: DogUseCase
    
    init(dogUseCase: DogUseCase) {
        self.dogUseCase = dogUseCase
    }
    
    func fetchBreeds() {
        Task {
            do {
                breeds = try await dogUseCase.fetchBreeds()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
