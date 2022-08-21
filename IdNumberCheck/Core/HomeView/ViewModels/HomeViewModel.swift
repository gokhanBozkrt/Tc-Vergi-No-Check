//
//  HomeViewModel.swift
//  IdNumberCheck
//
//  Created by Gokhan Bozkurt on 27.07.2022.
//

 
import Foundation

class HomeViewModel: ObservableObject {
    private var allIdNumbers = [IdNumberModel]()
    @Published var taxNumbers = [IdNumberModel]()
    @Published var nationalIdNumbers = [IdNumberModel]()
    @Published var idNumber = ""
    @Published var vergiNoSorgula = false
    init() {
        loadJsonFile()
    }
    
    var tcNoSonuc: Bool {
        NationalIdChecker.idNumberControl(nationalId: idNumber)
    }
    var vergiNoSonuc: Bool {
        TaxChecker.taxNumCheck(vergiNo: idNumber)
    }
    
    func save() {
        if !vergiNoSorgula {
            let newRequest = IdNumberModel(tcKimlikNo: idNumber, requestDate: Date(), requestResult: tcNoSonuc)
            allIdNumbers.insert(newRequest, at: 0)
        } else {
            let newRequest = IdNumberModel(vergiKimlikNo: idNumber, requestDate: Date(), requestResult: vergiNoSonuc)
            allIdNumbers.insert(newRequest, at: 0)
        }
       passToPublishedArrays()
        idNumber = ""
        saveToDocumentsDir()
    }
    
    func saveToDocumentsDir() {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(allIdNumbers) else {
            return
        }
        let jsonString = String(decoding: data, as: UTF8.self)
        do {
            try FileManager().saveDocument(contents: jsonString)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func loadJsonFile() {
        guard let data = FileManager().readDocument() else {
         return
        }
        self.allIdNumbers = Bundle.main.decode([IdNumberModel].self, from: data).sorted(by: {$0.requestDate > $1.requestDate })
       passToPublishedArrays()
    }
    
    func passToPublishedArrays() {
        self.taxNumbers = allIdNumbers.filter { $0.vergiKimlikNo != nil}
        self.nationalIdNumbers = allIdNumbers.filter { $0.tcKimlikNo != nil}

    }
    
    func deleteAll() {
        allIdNumbers.removeAll()
        saveToDocumentsDir()
        loadJsonFile()
    }
    
}





 
