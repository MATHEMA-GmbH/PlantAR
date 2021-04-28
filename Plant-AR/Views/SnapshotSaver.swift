//
//  SnapshotSaver.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 20.04.21.
//

import Foundation
import UIKit
import Photos

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
