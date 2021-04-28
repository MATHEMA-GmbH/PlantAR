//
//  ViewRouter.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 21.04.21.
//

import SwiftUI
import AVFoundation

struct ViewRouter: View {

    @AppStorage("showOnboarding") var showOnboarding = OnboardingManager.shared.showOnboarding

    var body: some View {
        if showOnboarding == true {
            OnboardingView()
        } else if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            ContentView()
        } else {
            CameraAccessDeniedView()
        }
    }
}
