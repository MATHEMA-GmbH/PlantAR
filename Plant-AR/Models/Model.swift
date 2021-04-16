//
//  Model.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 18.11.20.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    private var cancellable: AnyCancellable?

    init(modelName: String) {
        self.modelName = modelName

        self.image = UIImage(named: modelName)!
        let filename = modelName + ".usdz"

        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error): print("Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: { (modelEntity) in
                self.modelEntity = modelEntity
                print("loaded \(self.modelName) successfully")
            })
    }
}
