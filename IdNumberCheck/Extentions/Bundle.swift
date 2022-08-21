//
//  Bundle.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 12.08.2022.
//

import Foundation

 public extension Bundle {
     func decode<T: Decodable>(_ type: T.Type,
                               from data: Data,
                               dateDecodingStategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                               keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {

         let decoder = JSONDecoder()
         decoder.dateDecodingStrategy = dateDecodingStategy
         decoder.keyDecodingStrategy = keyDecodingStrategy

         guard let loaded = try? decoder.decode(T.self, from: data) else {
             fatalError("Error: Failed to decode \(data) from bundle.")
         }
         return loaded
     }
 }

