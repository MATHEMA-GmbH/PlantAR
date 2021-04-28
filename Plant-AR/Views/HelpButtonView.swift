//
//  HelpButtonView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 21.04.21.
//

import SwiftUI

struct HelpButtonView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(destination: OnboardingView()) {
                    Image(systemName: "questionmark.circle")
                        .imageScale(.large)
                        .padding()
                        .foregroundColor(.white)
                }
            }
            Spacer()
        }
    }
}
