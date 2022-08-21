//
//  NationalIdCheckFunc.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 14.08.2022.
//

import Foundation


class NationalIdChecker {
  
   static func idNumberControl(nationalId: String) -> Bool {
       var tcNoInArray: [String]  {
           nationalId.map { String($0)}
       }
       
       let intTc = tcNoInArray.map { Int($0) ?? 0 }
       // ILK BASAMAK 0 OLAMAZ
        if intTc.first == 0 {
            return false
        }
        // 11 basamaklı olamalı
        if intTc.count != 11 {
            return false
        }
        // İlk 10 hanenin toplamının 10’a bölümünden kalan, son haneyi verir.
        
        // Toplam hepsi
        let sumAll = intTc.reduce(0, +)
        let lastNum = intTc.last ?? 0
        let firstTenSum = sumAll - lastNum
        // 10 hanenin 10 na bölümünden kalan
        let firtTenDivide = firstTenSum % 10
        if firtTenDivide != lastNum {
            return false
        }

        /* 1, 3, 5, 7 ve 9. hanelerin toplamının 7 katı ile 2, 4, 6 ve 8. hanelerin toplamı çıkartılır, sonucun 10’a bölümünden kalanı 10. haneyi verir
         */
       let sumOdd = (intTc[0] + intTc[2] + intTc[4] + intTc[6] + intTc[8]) * 7
       let sumEven = intTc[1] + intTc[3] + intTc[5] + intTc[7]
        let farkVeBolum = (sumOdd - sumEven) % 10
        let theTenth = intTc[9]
        if farkVeBolum != theTenth {
            return false
        }
       return true
    }
    
}
