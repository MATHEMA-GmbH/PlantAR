//
//  IntroView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 15.04.21.
//

import SwiftUI

struct FocusIntroView: View {
    var body: some View {
            VStack(alignment: .center, spacing: 30) {
                Text("onboarding_placement")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding([.top, .horizontal])
                HStack {
                    VStack(alignment: .center) {
                        Image("focus-square1")
                            .resizable()
                            .frame(minWidth: 50, maxWidth: 150, minHeight: 50, maxHeight: 150)
                            .aspectRatio(1/1, contentMode: .fill)
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .foregroundColor(Color.red)
                            .frame(maxWidth: 30, maxHeight: 30)
                            .aspectRatio(1/1, contentMode: .fit)
                    }
                    VStack(alignment: .center) {
                        Image("focus-square2")
                            .resizable()
                            .frame(minWidth: 50, maxWidth: 150, minHeight: 50, maxHeight: 150)
                            .aspectRatio(1/1, contentMode: .fill)
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .foregroundColor(Color.green)
                            .frame(maxWidth: 30, maxHeight: 30)
                            .aspectRatio(1/1, contentMode: .fit)
                    }
                }.frame(maxWidth: .infinity)
            }
    }
}
