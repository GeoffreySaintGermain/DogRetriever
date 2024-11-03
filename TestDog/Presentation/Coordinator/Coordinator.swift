//
//  Coordinator.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreen: FullScreenPage?
    
    private let resolver = AppAssembler.shared.resolver

    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
}

extension Coordinator {
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .home: HomePageView(viewModel: self.resolver.resolved(HomePageViewModel.self))
        case .breed(let breed):
            BreedView(viewModel: self.resolver.resolved(BreedViewModel.self, argument: breed))
        }
    }
    
    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
    }
    
    @ViewBuilder
    func buildFullscreen(fullscreen: FullScreenPage) -> some View {
    }
}
