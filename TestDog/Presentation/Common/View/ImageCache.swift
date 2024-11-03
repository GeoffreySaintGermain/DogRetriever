//
//  ImageCache.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 30/10/2024.
//

import Foundation
import SwiftUI

struct ImageCache: View {
    
    let url: URL?
    @ObservedObject private var imageLoader: OptionalImageLoader
    
    init(url: URL?) {
        self.url = url
        self.imageLoader = OptionalImageLoader(url: url)
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}
