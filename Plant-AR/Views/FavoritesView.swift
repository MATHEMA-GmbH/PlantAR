//
//  FavoritesView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 20.01.21.
//

import SwiftUI

struct FavoritesView: View {

    @Binding var showFavorites: Bool
    @Binding var isInsertViewShown: Bool
    @Binding var selectedModel: Model?
    @EnvironmentObject var favorites: Favorites
    var models: [Model]

    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 20) {
                    ForEach(0 ..< self.models.count) { index in
                        if self.favorites.contains(self.models[index]) {
                            Button(action: {
                                self.selectedModel = self.models[index]
                                self.isInsertViewShown = true
                            }, label: {
                                Image(uiImage: self.models[index].image)
                                    .resizable()
                                    .frame(height: 60)
                                    .aspectRatio(1/1, contentMode: .fit)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .contextMenu {
                                        ContextMenuView(plant: self.models[index])
                                    }
                            }).buttonStyle(PlainButtonStyle())
                        }
                    }
                    Spacer()
                }.frame(maxWidth: .infinity)
                .padding()
                Spacer()
            }
            .navigationBarTitle(Text("Favoriten"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showFavorites.toggle()
                                    }, label: {
                                        Text("Fertig").bold()
                                    }))
        }
    }
}
