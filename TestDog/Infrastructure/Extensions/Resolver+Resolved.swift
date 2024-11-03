//
//  Resolver+Resolved.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation
import Swinject

extension Resolver {
    
    @inlinable
    func resolved<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = resolve(serviceType) else {
            fatalError("\(serviceType) not found. Register \(serviceType) in an Assembly.")
        }
        
        return service
    }
    
    @inlinable
    func resolved<Service, Arg>(_ serviceType: Service.Type, argument: Arg) -> Service {
        guard let service = resolve(serviceType, argument: argument) else {
            fatalError("\(serviceType) not found. Register \(serviceType) in an Assembly.")
        }
        
        return service
    }
}
