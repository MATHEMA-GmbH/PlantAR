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
    @State private var showPlantInfo = false
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
                                        ContextMenuView(plant: self.models[index], showPlantInfo: $showPlantInfo)
                                    }
                            }).buttonStyle(PlainButtonStyle())
                        }
                    }
                    Spacer()
                }.frame(maxWidth: .infinity)
                .padding()
                Spacer()
            }
            .sheet(isPresented: $showPlantInfo, content: {PlantInfoView(showPlantInfo: $showPlantInfo)})
            .navigationBarTitle(Text("favorites_title"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showFavorites.toggle()
                                    }, label: {
                                        Text("done").bold()
                                    }))
        }
    }
}
