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
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
            switch status {
            case .authorized:
                UIImageWriteToSavedPhotosAlbum(
                    compressedImage, self, #selector(self.saveError), nil)
            case .denied:
                self.title = NSLocalizedString("access_denied", comment: "")
                self.message =
                   NSLocalizedString("snapshot_saver_1", comment: "")
                self.isPresented = true
                print("access denied")
            case .limited:
                self.title = NSLocalizedString("snapshot_saver_2", comment: "")
                self.message =
                    NSLocalizedString("snapshot_saver_1", comment: "")
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
            title = NSLocalizedString("snapshot_error_1", comment: "")
            message = NSLocalizedString("snapshot_error_2", comment: "")
            isPresented = true
            print("saving the snapshot failed")

        } else {
            title = NSLocalizedString("snapshot_successful_1", comment: "")
            message = NSLocalizedString("snapshot_successful_2", comment: "")
            isPresented = true
            print("snapshot successfully saved")
        }
    }
}
