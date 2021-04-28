//
//  FavoritesIntroView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 19.04.21.
//

import SwiftUI

struct FavoritesIntroView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Füge eine Pflanze zu deinen Favoriten hinzu, indem du sie im Menü für wenige Sekunden antippst.")
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)
            Image("favorites-intro")
                .resizable()
                .aspectRatio((UIImage(named: "favorites-intro"))!.size, contentMode: .fit)
                .frame(maxWidth: 450, maxHeight: 150)
                .shadow(radius: 10)
                .padding(.horizontal)
            Text("Danach erscheint die Pflanze zusätzlich im Favoriten-Menü (\(Image(systemName: "heart.fill")))")
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }.font(.title3)
    }
}
