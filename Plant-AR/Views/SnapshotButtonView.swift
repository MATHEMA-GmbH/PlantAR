//
//  SnapshotButtonView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 10.12.20.
//

import Foundation
import SwiftUI
import UIKit
import Photos

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

class SnapshotSaver: NSObject, ObservableObject {
    @Published var isPresented = false
    @Published var title: String = ""
    @Published var message: String = ""

    func saveSnapshot(compressedImage: UIImage) {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            switch status {
            case .authorized:
                UIImageWriteToSavedPhotosAlbum(
                    compressedImage, self, #selector(self.saveError), nil)
            case .denied:
                self.title = "Zugriff nicht erlaubt"
                self.message =
                    "Um Fotos speichern zu können, gehe in die Systemeinstellungen und erlaube den Zugriff auf alle Fotos"
                self.isPresented = true
                print("access denied")
            case .limited:
                self.title = "Zugriff auf alle Fotos erlauben"
                self.message =
                    "Um Fotos speichern zu können, gehe in die Systemeinstellungen und erlaube den Zugriff auf alle Fotos"
                self.isPresented = true
                print("limited access only")
            case .notDetermined:
                print("access not determined")
            case .restricted:
                print("access restricted")
            @unknown default:
                break
            }
        }
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if error != nil {
            title = "Fehler!"
            message = "Dein Snapshot konnte nicht gespeichert werden"
            isPresented = true
            print("saving the snapshot failed")

        } else {
            title = "Pflanztastisch!"
            message = "Dein Snapshot wurde erfolgreich gespeichert!"
            isPresented = true
            print("snapshot successfully saved")
        }
    }
}
