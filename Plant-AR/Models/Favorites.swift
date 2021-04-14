//
//  Favorites.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 10.12.20.
//

import Foundation
import SwiftUI

class Favorites: ObservableObject {

    @Published var plants: Set<String>
    let defaults = UserDefaults.standard

    init() {
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let plantData = try? decoder.decode(Set<String>.self, from: data)
            self.plants = plantData ?? []
        } else {
            self.plants = []
        }
    }

    func contains(_ plant: Model) -> Bool {
        plants.contains(plant.modelName)
    }

    func add(_ plant: Model) {
        plants.insert(plant.modelName)
        print("\(plant.modelName) is now a favorite")
        save()
    }

    func remove(_ plant: Model) {
        plants.remove(plant.modelName)
        print("\(plant.modelName) is no favorite anymore")
        save()
    }

    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(plants) {
            defaults.set(encoded, forKey: "Favorites")
        }
    }
}
