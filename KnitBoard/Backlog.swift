//
//  Backlog.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation
import SwiftUI

class Backlog: ObservableObject{
    @Published var tickets: [Ticket] = []
    
    init(tickets: [Ticket]) {
        self.tickets = tickets
    }
    
    func updateTicket(_ ticket: Ticket) {
        if let ticketIndex = tickets.firstIndex(of: ticket) {
            tickets.remove(at: ticketIndex)
            tickets.insert(ticket, at: ticketIndex)
        } else {
            tickets.append(ticket)
        }
        
    }
}
