//
//  Ticket.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation
import Combine

protocol TicketUpdatedDelegate: class {
    func ticketUpdated(_ ticket: Ticket)
}

enum TicketStatus: Int, CaseIterable, Codable {
    
    case needsDefinition = 0
    case readyToKnit
    case inProgress
    case blocking
    case finished
    
    var description: String {
        switch self {
        case .needsDefinition:
            return "Needs Definition"
        case .readyToKnit:
            return "Ready to Knit"
        case .inProgress:
            return "In Progress"
        case .blocking:
            return "Blocking"
        case .finished:
            return "Finished"
        }
    }
}

class Ticket: NSObject, Identifiable, ObservableObject, Codable {
    static func == (lhs: Ticket, rhs: Ticket) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: UUID
    @Published var name: String
    @Published var status: TicketStatus
    @Published var pattern: String
    @Published var yarn: String
    
    init(name: String, status: TicketStatus = .needsDefinition, pattern: String, yarn: String) {
        self.id = UUID.init()
        self.name = name
        self.status = status
        self.pattern = pattern
        self.yarn = yarn
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case pattern
        case yarn
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        status = try values.decode(TicketStatus.self, forKey: .status)
        pattern = try values.decode(String.self, forKey: .pattern)
        yarn = try values.decode(String.self, forKey: .yarn)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(status, forKey: .status)
        try container.encode(pattern, forKey: .pattern)
        try container.encode(yarn, forKey: .yarn)
    }
}

extension Ticket: NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] {
        return [kUTTypeJSON as String]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        completionHandler(try? JSONEncoder().encode(self), nil)
        return nil
    }
    
    
}

let testTicket = Ticket(name: "Project 1", status: .needsDefinition, pattern: "Pattern 1", yarn: "Yarn 1")
