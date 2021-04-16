//
//  BrowseView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 19.01.21.
//

import SwiftUI

struct PlantsView: View {
    @Binding var showPlants: Bool
    @Binding var isInsertViewShown: Bool
    @Binding var selectedModel: Model?
    @EnvironmentObject var favorites: Favorites
    var models: [Model]
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(0 ..< self.models.count) { index in
                            Button(action: {
                                print("\(self.models[index].modelName) chosen")
                                self.selectedModel = self.models[index]
                                self.isInsertViewShown = true
                            }, label: {
                                Image(uiImage: self.models[index].image)
                                    .resizable()
                                    .frame(height: 80)
                                    .aspectRatio(1/1, contentMode: .fit)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .contextMenu {
                                        ContextMenuView(plant: self.models[index])
                                    }
                            }).buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Menü"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showPlants.toggle()
                                    }, label: {
                                        Text("Fertig").bold()
                                    }))
        }
    }
}
