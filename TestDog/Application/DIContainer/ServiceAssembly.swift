//
//  ServiceAssembly.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Swinject

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkService.self) { resolver in
            DefaultNetworkService(logger: resolver.resolved(NetworkLogger.self))
        }.inObjectScope(.container)
        
        container.register(NetworkLogger.self) { resolver in
            DefaultNetworkLogger()
        }.inObjectScope(.container)
    }
}
