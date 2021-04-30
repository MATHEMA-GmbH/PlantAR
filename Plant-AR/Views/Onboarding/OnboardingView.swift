//
//  OnboardingView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 19.04.21.
//

import Foundation
import SwiftUI

struct OnboardingView: View {

    @State private var selectedPage = 0

    var body: some View {
        VStack {
            TabView(selection: $selectedPage) {
                MenuIntroView().tag(0)
                InsertIntroView().tag(1)
                FocusIntroView().tag(2)
                FavoritesIntroView().tag(3)
                SnapshotIntroView().tag(4)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }.background(Color(UIColor.systemBackground))
        .padding(.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
