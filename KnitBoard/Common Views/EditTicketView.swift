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
    @Binding var shouldContinueEditing: Bool
    @Binding var selectedStatus: TicketStatus {
        didSet {
            ticket.status = selectedStatus
        }
    }
    var statuses: [TicketStatus] = TicketStatus.allCases
    var body: some View {
        let statusBinding = Binding(get: {self.selectedStatus.rawValue},
                                    set: { self.selectedStatus = TicketStatus(rawValue: $0)! })
        return VStack() {
            HStack() {
                Text("Name:")
                TextField("Name", text: $ticket.name)
                
            }
            Picker(selection: statusBinding, label: Text("Status:")){
                ForEach(0 ..< statuses.count) { index in
                    Text(TicketStatus(rawValue: index)!.description).tag(index)
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
            
            Button(action: {
                self.shouldContinueEditing = false
            }) {
                Text("Done").padding()
            }
        }.padding()
    }
}

struct EditTicketView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            EditTicketView(ticket: .constant(testTicket), shouldContinueEditing: .constant(true), selectedStatus: .constant(.needsDefinition)).colorScheme(.dark)
            EditTicketView(ticket: .constant(testTicket), shouldContinueEditing: .constant(true), selectedStatus: .constant(.needsDefinition)).colorScheme(.light)
        }
    }
}
