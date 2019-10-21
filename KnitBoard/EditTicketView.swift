//
//  EditTicketView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct EditTicketView: View {
    @Binding var ticket: Ticket
    var statuses: [TicketStatus] = TicketStatus.allCases
    var body: some View {
        VStack() {
            HStack() {
                Text("Name:")
                TextField("Name", text: $ticket.name)
                
            }
            Picker(selection: $ticket.status, label: Text("Status:")){
                ForEach(statuses) { status in
                    Text(status.rawValue)
                }
            }
            HStack() {
                Text("Pattern:")
                TextField("Pattern", text: $ticket.pattern)
            }
            HStack() {
                Text("Yarn:")
                TextField("Yarn", text: $ticket.yarn)
            }
        }
    }
}

struct EditTicketView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ticket = Ticket(name: "My Sweater", pattern: "A pattern", yarn: "a yarn")
        return EditTicketView(ticket: .constant(ticket))
    }
}
