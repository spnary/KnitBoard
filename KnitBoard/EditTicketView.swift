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
        let statusBinding = Binding(get: {
            self.statuses.firstIndex(of: self.ticket.status) ?? 0
            
        }, set: { index in
            self.ticket.status = self.statuses[index]
            
        })
        return VStack() {
            HStack() {
                Text("Name:")
                TextField("Name", text: $ticket.name)
                
            }
            Picker(selection: statusBinding, label: Text("Status:")){
                ForEach(0 ..< statuses.count) { index in
                    Text(self.statuses[index].rawValue).tag(index)
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
