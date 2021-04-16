//
//  ContentView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 18.11.20.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ContentView: View {
    @EnvironmentObject var arViewModel: ARViewModel
    @ObservedObject var favorites = Favorites()
    @State private var showFavorites = false
    @State private var showPlants = false
    @State private var isInsertViewShown = false
    @State private var selectedModel: Model?
    @State private var placedModel: Model?
    @AppStorage("showIntro") var showIntro: Bool = true
    var loader = ModelLoader()
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ARViewContainer(chosenModel: self.$placedModel)
                    .edgesIgnoringSafeArea(.all)

                if self.isInsertViewShown {
                    InsertView(isInsertViewShown: self.$isInsertViewShown,
                               selectedModel: self.$selectedModel,
                               placedModel: self.$placedModel)
                } else {
                    MenuView(showFavorites: $showFavorites,
                             showBrowse: $showPlants,
                             isInsertViewShown: self.$isInsertViewShown,
                             selectedModel: self.$selectedModel,
                             models: loader.loadModels())
                }
                SnapshotButtonView()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }.sheet(isPresented: $showIntro, content: {
            IntroView(showIntro: $showIntro)
        })
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(favorites)

    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
