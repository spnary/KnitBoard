//
//  BoardColumnView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/26/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct BoardColumnView: View {
    var status: TicketStatus
    @Binding var tickets: [Ticket]
    @EnvironmentObject var backlog: Backlog
    var body: some View {
        let dropDelegate = TicketDropDelegate(status: status, backlog: backlog)
        return VStack(spacing: 5.0) {
            ForEach(tickets.filter(){$0.status == status}) { ticket in
                TicketView(ticket: ticket)
            }
            Spacer()
        }.frame(minWidth: 150, maxHeight: .infinity)
    .onDrop(of: [kUTTypeJSON as String], delegate: dropDelegate)
    }
}

struct BoardColumnView_Previews: PreviewProvider {
    static var previews: some View {
        BoardColumnView(status: .needsDefinition,tickets: .constant(testTickets)).frame(width: 200)
    }
}
