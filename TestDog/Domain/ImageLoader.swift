//
//  ImageLoader.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 30/10/2024.
//

import Combine
import Foundation
import SwiftUI

final class OptionalImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    private var subscriptions = Set<AnyCancellable>()

    init(url: URL?, placeholder: UIImage? = nil) {
        image = placeholder
        guard let url = url else {
            return
        }

        ImageURLStorage.shared
            .cachedImage(with: url)
            .map { image = $0 }

        ImageURLStorage.shared
            .getImage(for: url)
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] image in
                    self?.image = image
                })
            .store(in: &subscriptions)
    }
}
