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
    @Binding var isInsertViewShown: Bool
    @Binding var selectedModel: Model?
    @EnvironmentObject var favorites: Favorites
    var models: [Model]
    var body: some View {
        VStack {
            Spacer()
            MenuBar(showFavorites: $showFavorites,
                    showBrowse: $showBrowse,
                    isPlacementEnabled: $isInsertViewShown,
                    selectedModel: $selectedModel,
                    models: self.models)
        }
    }
}
