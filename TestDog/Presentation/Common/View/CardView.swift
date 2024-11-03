//
//  CardView.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 03/11/2024.
//

import SwiftUI

struct CardView<Content: View>: View {

    var content: (() -> Content)
    
    private let lineWidth: CGFloat = 2
    
    var body: some View {
        VStack(alignment: .leading) {
            content()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: DogRadius.m)
                .stroke(DogColor.primary, lineWidth: 2)
        }
    }
}

#Preview {
    CardView {
        Group {
            Text("title")
                .bold()
                .padding(.bottom)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation")
        }
    }
}
