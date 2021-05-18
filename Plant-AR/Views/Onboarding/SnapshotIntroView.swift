//
//  SnapshotIntroView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 19.04.21.
//

import SwiftUI

struct SnapshotIntroView: View {

    @AppStorage("showOnboarding") var showOnboarding = OnboardingManager.shared.showOnboarding
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(alignment: .center) {
            Text("onboarding_snapshot_1")
                .multilineTextAlignment(.center)
                .padding([.top, .horizontal])
            Image("snapshot-button")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1/1, contentMode: .fill)
            Text("onboarding_snapshot_2")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Button(action: {
                if showOnboarding == false {
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showOnboarding = false
                }
            }, label: {
                Text("Start")
                    .padding()
                    .frame(maxWidth: 200, maxHeight: 50)
                    .background(
                        Capsule().foregroundColor(Color("gras-green")))
            }).accentColor(.white)
            .padding()
        }
        .font(.title3)
    }
}
