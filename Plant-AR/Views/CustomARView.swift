//
//  CustomARView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 10.12.20.
//

import Foundation
import SwiftUI
import FocusEntity
import RealityKit
import ARKit
import Combine

class CustomARView: ARView {

    var focusEntity: FocusEntity?
    @AppStorage("showOnboarding") var showOnboarding = OnboardingManager.shared.showOnboarding

    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        self.addCoaching()
        self.setupARView()
        self.focusEntity = FocusEntity(on: self, style: .classic(color: UIColor(Color("focus-square"))))
    }

    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupARView() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic

        // Is LiDAR available?
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) &&
            ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) {

            // enable depth api
            config.sceneReconstruction = .mesh

            // person occlusion
            config.frameSemantics = .personSegmentationWithDepth
        }
            self.session.run(config, options: [])
    }
}

extension CustomARView: FocusEntityDelegate {
    func toTrackingState() {
        print("tracking")
    }
    func toInitializingState() {
        print("initializing")
    }
}

extension CustomARView: ARCoachingOverlayViewDelegate {

    func addCoaching() {
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.goal = .horizontalPlane
        coachingOverlay.session = self.session
        coachingOverlay.delegate = self
        self.addSubview(coachingOverlay)
    }

    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        coachingOverlayView.activatesAutomatically = false
    }
}
