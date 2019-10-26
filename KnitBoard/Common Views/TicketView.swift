//
//  TicketView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct TicketView: View {
    var ticket: Ticket
    var body: some View {
        VStack(alignment: .leading) {
            PropertyView(propertyName: "Name", propertyValue: ticket.name)
            PropertyView(propertyName: "Status", propertyValue: ticket.status.description)
            PropertyView(propertyName: "Pattern", propertyValue: ticket.pattern)
            PropertyView(propertyName: "Yarn", propertyValue: ticket.yarn)
        }
        .frame(maxWidth: .infinity, alignment:.leading)
        .padding()
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        let previewTicket = Ticket(name: "My Project", pattern: "A cool pattern", yarn: "A soft yarn")
        return TicketView(ticket: previewTicket)
    }
}