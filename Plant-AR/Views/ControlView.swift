//
//  ControlView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 19.01.21.
//

import SwiftUI

struct MenuView: View {
    @Binding var showFavorites: Bool
    @Binding var showBrowse: Bool
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?

    @EnvironmentObject var favorites: Favorites

    var models: [Model]

    var body: some View {
        VStack {
            Spacer()
            MenuBar(showFavorites: $showFavorites,
                    showBrowse: $showBrowse,
                    isPlacementEnabled: $isPlacementEnabled,
                    selectedModel: $selectedModel,
                    models: self.models)
        }
    }
}

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
                              isPlacementEnabled: self.$isPlacementEnabled,
                              selectedModel: self.$selectedModel,
                              models: self.models)
            }
            Spacer()
            // MENU
            MenuButton(symbol: "scale.3d") {
                self.showBrowse.toggle()
            }.sheet(isPresented: $showBrowse) {
                BrowseView(showBrowse: $showBrowse,
                           isPlacementEnabled: self.$isPlacementEnabled,
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

struct MenuButton: View {
    let symbol: String
    let action: () -> Void

    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(systemName: symbol)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        })
        .frame(width: 50, height: 50)
    }
}
