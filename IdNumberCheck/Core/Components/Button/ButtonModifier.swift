//
//  ButtonModifier.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 29.07.2022.
//

import SwiftUI

struct ButtomModifier: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
           }
    }
extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        self.modifier(ButtomModifier(backgroundColor: backgroundColor))
    }
}

