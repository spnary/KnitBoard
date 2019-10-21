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
    var body: some View {
        NavigationView() {
                List(backlog.tickets) { ticket in
                    NavigationLink(destination: EditTicketView(ticket: Binding<Ticket>(get: { ticket }, set: { ticket in
                        self.backlog.updateTicket(ticket)
                    }))) {
                        TicketView(ticket: ticket)
                    }
                    

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("windowBackgroundColor"))
        }
        .navigationViewStyle(DefaultNavigationViewStyle())
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
