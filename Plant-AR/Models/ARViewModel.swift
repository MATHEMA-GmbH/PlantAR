//
//  DataModel.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 01.12.20.
//

import Foundation
import RealityKit

final class ARViewModel: ObservableObject {

    static let shared = ARViewModel()
    var arView: ARView!

    private init() {
        arView = CustomARView(frame: .zero)
    }
}
