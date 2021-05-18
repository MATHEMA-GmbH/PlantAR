//
//  AppReviewRequest.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 10.05.21.
//

import SwiftUI
import StoreKit

struct AppReviewRequest {

    @AppStorage("runsSinceLastRequest") var runsSinceLastRequest = 0
    @AppStorage("version") var version = ""
    var threshold = 3
    static let shared = AppReviewRequest()

    private init() {}

    func requestReview() {
        runsSinceLastRequest += 1
        guard let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {return}
        let currentVersion = appVersion.components(separatedBy: ".")
        if !currentVersion[1].isEmpty && currentVersion[1] != version {
            if runsSinceLastRequest >= threshold {
                if let scene = UIApplication.shared.connectedScenes
                    .first(where: {$0.activationState == .foregroundActive}) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                    version = currentVersion[0]
                    runsSinceLastRequest = 0
                }
            }
        } else {
            runsSinceLastRequest = 0
        }
    }
}
