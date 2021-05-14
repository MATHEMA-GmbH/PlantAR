//
//  InsertIntroView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 19.04.21.
//

import SwiftUI

struct InsertIntroView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("onboarding_plant_select_2")
                .multilineTextAlignment(.center)
                .padding([.top, .horizontal])
                Label {
                    Text("confirm")
                } icon: {
                    Image("insert-checkmark")
                        .resizable()
                        .frame(maxWidth: 40, maxHeight: 40)
                        .aspectRatio(1/1, contentMode: .fit)
                }
            Label {
                Text("cancel ")
            } icon: {
                Image("insert-xmark")
                    .resizable()
                    .frame(maxWidth: 40, maxHeight: 40)
                    .aspectRatio(1/1, contentMode: .fit)
            }
            Image("insert-screen")
                .resizable()
                .aspectRatio((UIImage(named: "insert-screen"))!.size, contentMode: .fit)
                .frame(maxWidth: 500, maxHeight: 350)
                .shadow(radius: 10)
                .padding(.horizontal)
        }.font(.title3)
    }
}
