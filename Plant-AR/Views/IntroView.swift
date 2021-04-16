//
//  IntroView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 15.04.21.
//

import SwiftUI

struct IntroView: View {
    @Binding var showIntro: Bool
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 30) {
                Spacer()
                Text("Um eine Pflanze platzieren zu können, muss das Quadrat geschlossen sein.")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: geometry.size.width)
                HStack {
                    VStack(alignment: .center) {
                        Image("focus-square1")
                            .resizable()
                            .frame(minWidth: 50, maxWidth: 150, minHeight: 50, maxHeight: 150)
                            .aspectRatio(1/1, contentMode: .fill)
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .foregroundColor(Color.red)
                            .frame(maxWidth: 50, maxHeight: 50)
                    }
                    VStack(alignment: .center) {
                        Image("focus-square2")
                            .resizable()
                            .frame(minWidth: 50, maxWidth: 150, minHeight: 50, maxHeight: 150)
                            .aspectRatio(1/1, contentMode: .fill)
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .foregroundColor(Color.green)
                            .frame(maxWidth: 50, maxHeight: 50)
                    }
                }.frame(width: geometry.size.width)
                Spacer()
                Button(action: {
                    showIntro = false
                }, label: {
                    Text("Verstanden")
                        .font(.title)
                        .foregroundColor(.white)
                }).background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .frame(width: geometry.size.width/2, height: 50)
                        .foregroundColor(Color("gras-green"))
                )
                Spacer()
            }.frame(maxWidth: geometry.size.width)
        }
    }
}
