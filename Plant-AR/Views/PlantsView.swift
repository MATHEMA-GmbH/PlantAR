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
    @State private var showPlantInfo = false

    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 20) {
                    ForEach(0 ..< self.models.count) { index in
                        Button(action: {
                            print("\(self.models[index].modelName) chosen")
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
                    Spacer()
                }.frame(maxWidth: .infinity)
                .padding()
                Spacer()
            }
            .sheet(isPresented: $showPlantInfo, content: {PlantInfoView(showPlantInfo: $showPlantInfo)})
            .onAppear {
                AppReviewRequest.shared.requestReview()
            }
            .navigationBarTitle(Text("menu_title"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showPlants.toggle()
                                    }, label: {
                                        Text("done").bold()
                                    }))
        }
    }
}
