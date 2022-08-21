//
//  Identifier.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 27.07.2022.
//

import Foundation

struct IdNumberModel: Codable, Identifiable {
    var id = UUID()
    var tcKimlikNo: String?
    var vergiKimlikNo: String?
    var requestDate: Date
    var requestResult: Bool
    

    var tcNo: String {
        tcKimlikNo ?? ""
    }
    var vergiNo: String {
        vergiKimlikNo ?? ""
    }

    init(tcKimlikNo: String? = nil,vergiKimlikNo: String? = nil,requestDate: Date,requestResult: Bool) {
        self.tcKimlikNo = tcKimlikNo
        self.vergiKimlikNo = vergiKimlikNo
        self.requestDate = requestDate
        self.requestResult = requestResult
    }
}





