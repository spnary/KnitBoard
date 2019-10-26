//
//  BacklogView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct BacklogView: View {
    @EnvironmentObject var backlog: Backlog
    @State var ticketIndexToEdit = 0
    
    var body: some View {
        if backlog.isEditing {
            return AnyView(EditTicketView(ticket: self.$backlog.tickets[ticketIndexToEdit], shouldContinueEditing: self.$backlog.isEditing))
        } else {
            return AnyView(List(backlog.tickets) { ticket in
                return Button(action: {
                    self.ticketIndexToEdit = self.backlog.tickets.firstIndex(of: ticket) ?? 0
                    self.backlog.isEditing = true
                }) {
                    return TicketView(ticket: ticket)
                }.buttonStyle(PlainButtonStyle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity))
        }
    }
}

struct BacklogView_Previews: PreviewProvider {
    static var previews: some View {
        let tickets = [
            Ticket(name: "Project 1", pattern: "Pattern 1", yarn: "Yarn 1"),
            Ticket(name: "Project 2", pattern: "Pattern 2", yarn: "Yarn 2")
        ]
        let backlog = Backlog(tickets: tickets)
        return BacklogView().environmentObject(backlog)
    }
}
