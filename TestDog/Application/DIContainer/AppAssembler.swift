//
//  AppAssembler.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Swinject

final class AppAssembler {
    
    static let shared: AppAssembler = AppAssembler()
    
    var resolver: Resolver { assembler.resolver }
    
    private let assembler: Assembler
    
    private init() {
        self.assembler = Assembler([
            ViewModelAssembly(),
            UseCaseAssembly(),
            RepositoryAssembly(),
            ServiceAssembly()
        ])
    }
}
