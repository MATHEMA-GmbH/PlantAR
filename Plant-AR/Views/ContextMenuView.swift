//
//  ContextMenuView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 29.03.21.
//

import SwiftUI

struct ContextMenuView: View {

    @EnvironmentObject var favorites: Favorites
    var plant: Model

    var body: some View {
        if self.favorites.contains(plant) {
            Button(action: {self.favorites.remove(plant)
            }, label: {
                Text("Lieblingspflanze entfernen?")
                Image(systemName: "heart.slash.fill")
                    .foregroundColor(.red)
            })
        } else {
            Button(action: {self.favorites.add(plant)
            }, label: {
                HStack {
                    Text("Als Lieblingspflanze speichern?")
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }
            })
        }
    }
}
