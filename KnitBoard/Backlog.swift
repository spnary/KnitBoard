//
//  Backlog.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation

class Backlog: ObservableObject{
    @Published var tickets: [Ticket] = []
    
    init(tickets: [Ticket]) {
        self.tickets = tickets
    }
}
