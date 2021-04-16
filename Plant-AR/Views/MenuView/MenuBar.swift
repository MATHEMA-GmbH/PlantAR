//
//  MenuBar.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 29.03.21.
//

import SwiftUI

struct MenuBar: View {
    @Binding var showFavorites: Bool
    @Binding var showBrowse: Bool
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @EnvironmentObject var favorites: Favorites
    var models: [Model]
    var body: some View {
        HStack {
            Spacer()
            // FAVORITES
            MenuButton(symbol: "heart.fill") {
                self.showFavorites.toggle()
            }.sheet(isPresented: $showFavorites) {
                FavoritesView(showFavorites: $showFavorites,
                              isInsertViewShown: self.$isPlacementEnabled,
                              selectedModel: self.$selectedModel,
                              models: self.models)
            }
            Spacer()
            // MENU
            MenuButton(symbol: "scale.3d") {
                self.showBrowse.toggle()
            }.sheet(isPresented: $showBrowse) {
                PlantsView(showPlants: $showBrowse,
                           isInsertViewShown: self.$isPlacementEnabled,
                           selectedModel: self.$selectedModel,
                           models: self.models)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(30)
        .background(Color.black.opacity(0.25))
        .edgesIgnoringSafeArea(.horizontal)
    }
}
