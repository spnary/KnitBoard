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
    var body: some View {
        VStack(alignment: .center) {
            Text(status.description)
            ScrollView() {
                ForEach(tickets.filter(){$0.status == status}) { ticket in
                    TicketView(ticket: ticket)
                    }
            }
        }
    }
}

struct BoardColumnView_Previews: PreviewProvider {
    static var previews: some View {
        BoardColumnView(status: .needsDefinition,tickets: .constant(testTickets)).frame(width: 200)
    }
}
