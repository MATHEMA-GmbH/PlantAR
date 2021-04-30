//
//  PlacementButtonView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 10.12.20.
//

import Foundation
import SwiftUI

struct InsertView: View {

    @Binding var isInsertViewShown: Bool
    @Binding var selectedModel: Model?
    @Binding var placedModel: Model?

    var body: some View {
        HStack {
            // Cancel Button
            Button(action: {
                self.resetParameters()
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .background(
                        ZStack {
                            Color("light-green")

                            Circle()
                                .foregroundColor(.white)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)

                            Circle()
                                .fill(
                                    LinearGradient(gradient: Gradient(
                                                    colors: [Color("light-green"), Color("sand")]),
                                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .padding(2)
                                .blur(radius: 2)

                        }
                    )
                    .clipShape(Circle())
                    .padding(20)
            })
            // Confirm Button
            Button(action: {
                self.placedModel = self.selectedModel
                self.resetParameters()
            }, label: {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .background(
                        ZStack {
                            Color("light-green")
                            Circle()
                                .foregroundColor(.white)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)
                            Circle()
                                .fill(
                                    LinearGradient(gradient: Gradient(
                                                    colors: [Color("light-green"), Color("sand")]),
                                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .padding(2)
                                .blur(radius: 2)
                        }
                    )
                    .clipShape(Circle())
                    .padding(20)
            })
        }
    }

    func resetParameters() {
        self.isInsertViewShown = false
        self.selectedModel = nil
    }
}
