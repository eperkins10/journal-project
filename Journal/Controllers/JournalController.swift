//
//  JournalController.swift
//  Journal
//
//  Created by Ethan Perkins on 11/16/21.
//

import Foundation

class JournalController {
    
    static let shared = JournalController()
    var journals: [Journal] = []
    
    
    func createJournalWith(title: String) {
        let newJournal = Journal(title: title)
        journals.append(newJournal)
    }
    
    func delete(journal: Journal) {
        guard let index = journals.firstIndex(of: journal) else { return }
        journals.remove(at: index)
    }
    
    func addEntryTo(journal: Journal, entry: Entry) {
        journal.entries.append(entry)
    }
    
    func removeEntryFrom(journal: Journal, entry: Entry) {
        guard let index = journal.entries.firstIndex(of: entry) else { return }
        journal.entries.remove(at: index)
        
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        do {
            let data = try JSONEncoder().encode(journals)
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
            journals = try JSONDecoder().decode([Journal].self, from: data)
            
            
        } catch {
            
        }
    }
    
    
}
