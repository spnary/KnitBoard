//
//  Ticket.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation

enum TicketStatus: String {
    case needsDefinition
    case readyToKnit
    case inProgress
    case blocking
    case finished
}

struct Ticket: Identifiable {
    let id: UUID
    let name: String
    let status: TicketStatus
    let pattern: String
    let yarn: String
    
    init(name: String, status: TicketStatus = .needsDefinition, pattern: String, yarn: String) {
        self.id = UUID.init()
        self.name = name
        self.status = status
        self.pattern = pattern
        self.yarn = yarn
    }
}
