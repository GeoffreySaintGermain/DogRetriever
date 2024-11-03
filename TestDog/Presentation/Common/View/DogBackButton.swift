//
//  DogBackButton.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 02/11/2024.
//

import SwiftUI

struct DogBackButton: View {
    
    var coordinator: Coordinator
    
    var body: some View {
        Button {
            coordinator.pop()
        } label: {
            HStack {
                Image(systemName: "chevron.backward")
                Text("Back")
            }
        }
    }
}
