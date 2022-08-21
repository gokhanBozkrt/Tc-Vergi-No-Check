//
//  UIApplication.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 29.07.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
