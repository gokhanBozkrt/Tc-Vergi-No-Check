//
//  Date.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 30.07.2022.
//

import Foundation

extension Date {
    var displayFormat: String {
        self.formatted(
            .dateTime
                .year(.twoDigits)
                .month(.twoDigits)
                .day(.twoDigits)
                .hour(.defaultDigits(amPM: .narrow))
                .minute(.twoDigits)
        )
    }
}
