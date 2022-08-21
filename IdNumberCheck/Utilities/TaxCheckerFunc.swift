//
//  TaxCheckerFunc.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 12.08.2022.
//

import Foundation

class TaxChecker {
   static  func taxNumCheck(vergiNo: String) -> Bool {
        if vergiNo.count != 10 {
            return false
        }
        var taxNoInArray: [String]  {
            vergiNo.map { String($0)}
        }
        
        let intTax = taxNoInArray.map { Int($0) ?? 0 }
       var total = 0
        var checkNumber = 0
        for i in 0..<9 {
           let temp1 = (intTax[i] + (9 - i)) % 10
           var temp2 = (temp1 * Int((pow(Double(2), Double(9 - i))))) % 9
            
            if temp1 != 0 && temp2 == 0 {
                temp2 = 9
            }
            total += temp2
           
        }
        if total % 10 == 0 {
            checkNumber = 0
        } else {
            checkNumber = 10 - (total % 10)
        }
        return intTax[9] == checkNumber
    }
}

