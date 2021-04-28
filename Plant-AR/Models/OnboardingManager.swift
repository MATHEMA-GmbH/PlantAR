//
//  OnboardingManager.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 21.04.21.
//

import Foundation
import SwiftUI

class OnboardingManager {

    @AppStorage("showOnboarding") var showOnboarding = true
    static var shared = OnboardingManager()

    private init() {}
}
