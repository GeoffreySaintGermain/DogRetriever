//
//  ContentView.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import SwiftUI

struct HomePageView: View {
    
    @StateObject var viewModel: HomePageViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                BreedListView(viewModel: viewModel)
            }
            .navigationTitle("Dogs everywhere!")
            .onAppear {
                viewModel.fetchBreeds()
            }
        }
    }
}

private struct BreedListView: View {
    
    @ObservedObject var viewModel: HomePageViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    @State private var searchText = ""
    
    private var searchResults: [Breed] {
        if searchText.isEmpty {
            return viewModel.breeds
        } else {
            return viewModel.breeds.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        List(searchResults) { breed in
            HStack {
                Text(breed.name)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                coordinator.push(page: .breed(breed: breed))
            }
        }
        .searchable(text: $searchText)
        .searchSuggestions {
            ForEach(searchResults) { result in
                Text(result.name)
                    .searchCompletion(result.name)
            }
        }
        .autocorrectionDisabled()
    }
}

#Preview {
    HomePageView(viewModel: AppAssembler.shared.resolver.resolved(HomePageViewModel.self))
}
