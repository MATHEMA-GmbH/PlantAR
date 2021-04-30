//
//  SecondIntroView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 19.04.21.
//

import SwiftUI

struct MenuIntroView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Wilkommen bei PlantAR!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("gras-green"))
                .padding()
            Text("Öffne das Auswahlmenü (\(Image(systemName: "scale.3d"))), um dort eine Pflanze auszuwählen.")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Image("MenuIntro")
                .resizable()
                .aspectRatio((UIImage(named: "MenuIntro"))!.size, contentMode: .fit)
                .frame(maxWidth: 450, maxHeight: 150)
                .shadow(radius: 10)
                .padding(.horizontal)
        }
    }
}
