//
//  Backlog.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation
import Combine

class Backlog: NSObject, ObservableObject, Codable {
    
    @Published var tickets: [Ticket] = [] {
        didSet {
            writeToFile()
        }
    }
    
    @Published var isEditing = false
    
    enum CodingKeys: String, CodingKey {
        case tickets
    }

    init(tickets: [Ticket]) {
        self.tickets = tickets
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tickets = try values.decode([Ticket].self, forKey: .tickets)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tickets, forKey: .tickets)
    }
    
    class func backlog(from url: URL) throws -> Backlog {
        let jsonData = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(Backlog.self, from: jsonData)
    }
    
    func update(_ ticket: Ticket) {
        guard let ticketIndex = tickets.firstIndex(where: {$0.id == ticket.id}) else { return }
        tickets.remove(at: ticketIndex)
        tickets.insert(ticket, at: ticketIndex)
    }
    
    private func writeToFile() {
        let encoder = JSONEncoder()
        let json = try? encoder.encode(self)
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL =  documentsURL.appendingPathComponent("backlog.json")
        try? json?.write(to: fileURL)
    }

}

let testTickets = [
    Ticket(name: "Project 1 with a really long name", pattern: "Pattern 1", yarn: "Yarn 1"),
    Ticket(name: "Project 2", pattern: "Pattern 2", yarn: "Yarn 2"),
    Ticket(name: "Project 3", pattern: "Pattern 3", yarn: "Yarn 3"),
    Ticket(name: "Project 4 with a really long name", pattern: "Pattern 1", yarn: "Yarn 1"),
    Ticket(name: "Project 5 with a really long name", pattern: "Pattern 1", yarn: "Yarn 1"),
    Ticket(name: "Chunky Hat", status: .readyToKnit, pattern: "Chunky Hat Pattern", yarn: "Super Tuff Puff Canary"),
    Ticket(name: "Chunky Hat", status: .readyToKnit, pattern: "Chunky Hat Pattern", yarn: "Super Tuff Puff Pink"),
    Ticket(name: "Sweater", status: .readyToKnit, pattern: "Bog Jacket", yarn: "Cotton Fleece"),
    Ticket(name: "Scarf", status: .inProgress, pattern: "Scarf with no name", yarn: "Lamb's Pride"),
    Ticket(name: "Cowl", status: .blocking, pattern: "Hillview Road Cowl", yarn: "Malabrigo Worsted Purple Mystery"),
    Ticket(name: "Sam Scarf", status: .finished, pattern: "Lost in transit", yarn: "Lang Yarns Asia (Yak)"),
    Ticket(name: "Sunlight Sam Shawl", status: .finished, pattern: "The Sunlight Shawl for Sad People", yarn: "Lorna's Lace Shepherd Sock Solid"),
    
]
let testBacklog = Backlog(tickets: testTickets)
