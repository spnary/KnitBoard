//
//  Backlog.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation
import Combine

class Backlog: ObservableObject {
    
    @Published var tickets: [Ticket] = []
    
    @Published var isEditing = false

    init(tickets: [Ticket]) {
        self.tickets = tickets
        
    }

}

let testTickets = [
    Ticket(name: "Project 1", pattern: "Pattern 1", yarn: "Yarn 1"),
    Ticket(name: "Project 2", pattern: "Pattern 2", yarn: "Yarn 2"),
    Ticket(name: "Project 3", pattern: "Pattern 3", yarn: "Yarn 3")
]
let testBacklog = Backlog(tickets: testTickets)
