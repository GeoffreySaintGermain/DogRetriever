//
//  BreedView.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

import SwiftUI

struct BreedView: View {
    
    @StateObject var viewModel: BreedViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        ScrollView {
            VStack {
                BreedDescriptionView(breed: viewModel.breed)
                DogImageListView(viewModel: viewModel)
            }
        }
        .onAppear {
            viewModel.fetchDogs()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                DogBackButton(coordinator: coordinator)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.breed.name)
    }
}

private struct BreedDescriptionView: View {
    
    let breed: Breed
    private let cornerRadius: CGFloat = DogRadius.s
    
    var body: some View {
        VStack(alignment: .leading) {
            if let url = breed.imageUrl {
                ImageCache(url: URL(string: url))
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: cornerRadius))
                    .frame(alignment: .leading)
            }
            
            HStack {
                InfoView(title: Text("Origin"), description: breed.origin)
                InfoView(title: Text("Lifespan"), description: breed.lifeSpan)
            }
            HStack {
                InfoView(title: Text("Height"), description: breed.height?.metric, extra: "cm")
                InfoView(title: Text("Weight"), description: breed.weight?.metric, extra: "kg")
            }
            InfoView(title: Text("Bred for"), description: breed.bredFor)
            InfoView(title: Text("Temperament"), description: breed.temperament)
        }
        .padding()
    }
}

private struct InfoView: View {
    
    var title: Text
    var description: String?
    var extra: String? = nil
    
    var body: some View {
        if let description, !description.isEmpty {
            CardView {
                Group {
                    title
                        .bold()
                        .padding(.bottom, DogPadding.s)
                    Text("\(description) \(extra ?? "")")
                        .lineLimit(3)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

private struct DogImageListView: View {
    
    
    @ObservedObject var viewModel: BreedViewModel
    
    @State private var gridColumns: Array = Array(repeating: GridItem(.flexible()), count: 3)
    
    private let cornerRadius: CGFloat = DogRadius.s
    
    var body: some View {
        LazyVGrid(columns: gridColumns) {
            ForEach(viewModel.dogs) { dog in
                if let url = dog.url {
                    ImageCache(url: URL(string: url))
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(.rect(cornerRadius: cornerRadius))
                }
            }
        }
        .padding()
    }
}
