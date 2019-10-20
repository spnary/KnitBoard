//
//  BacklogView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct BacklogView: View {
    var tickets: [Ticket]
    var body: some View {
        List(tickets) { ticket in
            TicketView(ticket: ticket)
        }
    }
}

struct BacklogView_Previews: PreviewProvider {
    static var previews: some View {
        let tickets = [
            Ticket(name: "Project 1", pattern: "Pattern 1", yarn: "Yarn 1"),
            Ticket(name: "Project 2", pattern: "Pattern 2", yarn: "Yarn 2")
        ]
        return BacklogView(tickets: tickets)
    }
}
