//
//  CameraAccessDeniedView.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 22.04.21.
//

import SwiftUI

struct CameraAccessDeniedView: View {
    var body: some View {
        VStack {
            Image(systemName: "camera.circle.fill")
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .frame(maxWidth: 40, maxHeight: 40)
                .padding()
            Text("Kamera-Zugriff nicht erlaubt")
                .foregroundColor(Color("gras-green"))
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Text("PlantAR kann deine Umgebung nicht anzeigen. Bitte aktiviere den Kamera-Zugriff in deinen Geräteeinstellungen.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Button(action: {
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: nil)
                }
            }, label: {
                Text("Öffne Einstellungen")
                    .padding()
                    .frame(maxWidth: 300, maxHeight: 50)
                    .background(
                        Capsule().foregroundColor(Color("gras-green")))
            }).accentColor(.white)
            .padding()
        }.font(.title3)
        .background(Color(UIColor.systemBackground))
        .frame(maxWidth: .infinity)

    }
}
