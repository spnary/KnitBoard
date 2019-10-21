//
//  Ticket.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation

enum TicketStatus: String, CaseIterable, Identifiable {
    var id: String {
        return self.rawValue
    }
    
    case needsDefinition = "Needs Definition"
    case readyToKnit = "Ready to Knit"
    case inProgress = "In Progress"
    case blocking = "Blocking"
    case finished = "Finished"
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
}
