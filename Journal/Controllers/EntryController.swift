//
//  EntryController.swift
//  Journal
//
//  Created by Ethan Perkins on 11/15/21.
//

import Foundation

class EntryController {
    
    
    
    static func createEntryWith(title: String, body: String, journal: Journal) {
        let newEntry = Entry(title: title, body: body, timestamp: 5.00)
        JournalController.shared.addEntryTo(journal: journal, entry: newEntry)
    }
    
    static func deleteEntry(entry: Entry, journal: Journal) {
        JournalController.shared.removeEntryFrom(journal: journal, entry: entry)
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: fileURL())
        } catch {
            print(error)
            print(error.localizedDescription)
            print("we had an error sving to our persistence storage")
        }
    }
    
    func loadFromPersistentStorage() {
        do {
            let data = try Data(contentsOf: fileURL())
            entries = try JSONDecoder().decode([Entry].self, from: data)
            
            
        } catch {
            
        }
    }
    
    
}
