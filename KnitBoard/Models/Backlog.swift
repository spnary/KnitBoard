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
    Ticket(name: "Project 1 with a really long name", pattern: "Pattern 1", yarn: "Yarn 1"),
    Ticket(name: "Project 2", pattern: "Pattern 2", yarn: "Yarn 2"),
    Ticket(name: "Project 3", pattern: "Pattern 3", yarn: "Yarn 3"),
    Ticket(name: "Chunky Hat", status: .readyToKnit, pattern: "Chunky Hat Pattern", yarn: "Super Tuff Puff Canary"),
    Ticket(name: "Chunky Hat", status: .readyToKnit, pattern: "Chunky Hat Pattern", yarn: "Super Tuff Puff Pink"),
    Ticket(name: "Sweater", status: .readyToKnit, pattern: "Bog Jacket", yarn: "Cotton Fleece"),
    Ticket(name: "Scarf", status: .inProgress, pattern: "Scarf with no name", yarn: "Lamb's Pride"),
    Ticket(name: "Cowl", status: .blocking, pattern: "Hillview Road Cowl", yarn: "Malabrigo Worsted Purple Mystery"),
    Ticket(name: "Sam Scarf", status: .finished, pattern: "Lost in transit", yarn: "Lang Yarns Asia (Yak)"),
    Ticket(name: "Sunlight Sam Shawl", status: .finished, pattern: "The Sunlight Shawl for Sad People", yarn: "Lorna's Lace Shepherd Sock Solid"),
    
]
let testBacklog = Backlog(tickets: testTickets)
