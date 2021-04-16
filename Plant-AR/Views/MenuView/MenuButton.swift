//
//  MenuButton.swift
//  Plant-AR
//
//  Created by Denise Fritsch on 29.03.21.
//

import SwiftUI

struct MenuButton: View {
    let symbol: String
    let action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(systemName: symbol)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        })
        .frame(width: 50, height: 50)
    }
}
