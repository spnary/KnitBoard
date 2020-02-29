//
//  TicketDropDelegate.swift
//  KnitBoard
//
//  Created by Stephen Nary on 2/27/20.
//  Copyright © 2020 Stephen Nary. All rights reserved.
//

import Foundation
import SwiftUI

struct TicketDropDelegate: DropDelegate {
    let status: TicketStatus
    let backlog: Backlog
    let decoder = JSONDecoder()
    @Binding var isDropping: Bool
    func performDrop(info: DropInfo) -> Bool {
        guard let item = info.itemProviders(for: [kUTTypeJSON as String]).first  else { return false }
        item.loadItem(forTypeIdentifier: kUTTypeJSON as String, options: nil) { (ticketData, error) in
            DispatchQueue.main.async {
                guard let ticketCoding = ticketData else { return }
                guard let ticket: Ticket = try? self.decoder.decode(Ticket.self, from: ticketCoding as! Data) else { return }
                ticket.status = self.status
                self.backlog.update(ticket)
            }
        }
        return true
    }
    
    func dropEntered(info: DropInfo) {
        isDropping = true
    }
    
    func dropExited(info: DropInfo) {
        isDropping = false
    }
}
