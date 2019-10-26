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

enum TicketStatus: Int, CaseIterable {
    
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

class Ticket: Identifiable, ObservableObject, Hashable {
    static func == (lhs: Ticket, rhs: Ticket) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: UUID
    @Published var name: String
    @Published var status: TicketStatus {
        didSet{
            objectWillChange.send()
        }
    }
    @Published var pattern: String
    @Published var yarn: String
    
    init(name: String, status: TicketStatus = .needsDefinition, pattern: String, yarn: String) {
        self.id = UUID.init()
        self.name = name
        self.status = status
        self.pattern = pattern
        self.yarn = yarn
    }
    
}

let testTicket = Ticket(name: "Project 1", status: .needsDefinition, pattern: "Pattern 1", yarn: "Yarn 1")
