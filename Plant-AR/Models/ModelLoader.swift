//
//  ModelLoader.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 30.03.21.
//

import Foundation

class ModelLoader {

    func loadModels() -> [Model] {
        let filemanager = FileManager.default

        guard let path = Bundle.main.resourcePath,
              let files = try? filemanager.contentsOfDirectory(atPath: path) else { return[] }

        var availableModels: [Model] = []

        for filename in files where filename.hasSuffix("usdz") {
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")

            let model = Model(modelName: modelName)

            availableModels.append(model)
        }
        return availableModels
    }
}
