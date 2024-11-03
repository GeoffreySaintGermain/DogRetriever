//
//  CoordinatorView.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .home)
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
