//
//  FileManagerDirectory.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 12.08.2022.
//

import Foundation

let fileName = "IdCheckRequest.json"
extension FileManager  {
    static var documentsDirectory: URL {
         let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
        
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.documentsDirectory.appendingPathComponent(docName).path)
    }
    
    func saveDocument(contents: String) throws {
        let url = Self.documentsDirectory.appendingPathComponent(fileName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch let error {
            print("Problem occured while writing documents driectory:\(error.localizedDescription)")
        }
    }
    
    func readDocument() -> Data? {
        let url = Self.documentsDirectory.appendingPathComponent(fileName)
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        return data
    }
    
}
    
  
    
    
    
    

