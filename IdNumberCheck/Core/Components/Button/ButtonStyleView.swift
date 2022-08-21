//
//  ButtonView.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 29.07.2022.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    let scaleAmount: CGFloat
    
    init(scaleAmount: CGFloat) {
        self.scaleAmount = scaleAmount
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
          //  .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    func withPressableButton(scaleAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableButtonStyle(scaleAmount: scaleAmount))
    }
}
 
