//
//  SnapshotButtonView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 10.12.20.
//

import Foundation
import SwiftUI

struct SnapshotButtonView: View {
    @EnvironmentObject var arViewModel: ARViewModel
    @ObservedObject var snapshotSaver = SnapshotSaver()
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.takeSnapshot()
                }, label: {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 30, height: 25)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(
                            ZStack {
                                Color("dark-green")
                                Circle()
                                    .foregroundColor(.white)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)

                                Circle()
                                    .fill(
                                        LinearGradient(gradient: Gradient(
                                                        colors: [Color("dark-green"), Color("gras-green")]),
                                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                    .padding(2)
                                    .blur(radius: 2)

                            }
                        )
                        .clipShape(Circle())
                        .padding()
                        .alert(isPresented: self.$snapshotSaver.isPresented) {
                            Alert(title: Text(snapshotSaver.title),
                                  message: Text(snapshotSaver.message),
                                  dismissButton: .default(Text("Ok")))
                        }
                })
            }
            Spacer()
        }
    }

    func takeSnapshot() {
        arViewModel.arView.snapshot(saveToHDR: false) { (image) in
            let compressedImage = UIImage(data: (image?.pngData())!)
            snapshotSaver.saveSnapshot(compressedImage: compressedImage!)
        }
    }
}
