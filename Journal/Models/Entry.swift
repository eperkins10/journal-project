//
//  Entry.swift
//  Journal
//
//  Created by Ethan Perkins on 11/15/21.
//

import Foundation

class Entry: Codable {
    
    
    var title: String
    var body: String
    var timestamp: Double
    
    init(title: String, body: String, timestamp: Double) {
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
}

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body
    }
    
    
}
