//
//  Ticket.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation

enum TicketStatus: String {
    case needsDefinition = "Needs Definition"
    case readyToKnit = "Ready to Knit"
    case inProgress = "In Progress"
    case blocking = "Blocking"
    case finished = "Finished"
}

struct Ticket: Identifiable {
    let id: UUID
    var name: String
    var status: TicketStatus
    var pattern: String
    var yarn: String
    
    init(name: String, status: TicketStatus = .needsDefinition, pattern: String, yarn: String) {
        self.id = UUID.init()
        self.name = name
        self.status = status
        self.pattern = pattern
        self.yarn = yarn
    }
}
