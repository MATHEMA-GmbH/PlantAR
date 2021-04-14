//
//  ARViewContainer.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 10.12.20.
//

import Foundation
import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var chosenModel: Model?

    func makeUIView(context: UIViewRepresentableContext<ARViewContainer>) -> ARView {
        return ARViewModel.shared.arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = self.chosenModel {
            if let modelEntity = model.modelEntity {
                let clonedEntity = modelEntity.clone(recursive: true)
                // middle of the screen for raycasting
                let point = CGPoint(x: uiView.bounds.midX, y: uiView.bounds.midY)
                // raycasting
                let results = uiView.raycast(from: point, allowing: .estimatedPlane, alignment: .any)
                if let firstResult = results.first {
                    let pos = simd_make_float3(firstResult.worldTransform.columns.3)
                    // place the plant
                    uiView.placeObj(object: clonedEntity, modelName: model.modelName, at: pos)
                }
                uiView.installGestures([.translation, .rotation], for: clonedEntity)
                uiView.enableObjectRemoval()
            }
            DispatchQueue.main.async {
                self.chosenModel = nil
            }
        }
    }
}
extension ARView {
    // REMOVE OBJECTS
    func enableObjectRemoval() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(recognizer:)))
        tapGestureRecognizer.numberOfTapsRequired = 2
        self.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: self)
        if let entity = self.entity(at: location) {
            if let anchorEntity = entity.anchor, anchorEntity.name == "object"{
                anchorEntity.removeFromParent()
                print("Removed anchor with name: " + anchorEntity.name)
            }
        }
    }

    func placeObj(object: ModelEntity, modelName: String, at point: SIMD3<Float>) {
        // create anchorEntity
        let objAnchor = AnchorEntity(world: point)
        // add model
        objAnchor.name = modelName
        objAnchor.addChild(object)
        objAnchor.name = "object"

        // generate collision shapes to interact with plants
        object.generateCollisionShapes(recursive: true)

        // add anchorEntity to AR-Scene
        self.scene.addAnchor(objAnchor)
    }
}
