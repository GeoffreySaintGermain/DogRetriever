//
//  DestinationCoordinator.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

protocol DestinationCoordinator: Identifiable, Hashable {}

extension DestinationCoordinator {
    var id: Self { self }
}
