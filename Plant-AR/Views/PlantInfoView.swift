//
//  PlantInfoView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 05.09.22.
//

import SwiftUI

struct PlantInfoView: View {

    @Binding var showPlantInfo: Bool

    var body: some View {
        VStack(alignment: .center) {
            Text("PlantInfo")
            Image(systemName: "leaf.fill")
        }.onDisappear {
            showPlantInfo = false
        }
    }
}

struct PlantInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PlantInfoView(showPlantInfo: .constant(true))
    }
}
