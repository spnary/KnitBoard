//
//  ContentView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var tickets: [Ticket]
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Button(action: {
                    
                }) {
                    Text("+")
                }
                Text("KnitBoard")
            }
            HStack(alignment: .top  ) {
                VStack(alignment: .leading) {
                    Text("Backlog")
                    Text("Board")
                }
                BacklogView(tickets: tickets)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let tickets = [
            Ticket(name: "Project 1", pattern: "Pattern 1", yarn: "Yarn 1"),
            Ticket(name: "Project 2", pattern: "Pattern 2", yarn: "Yarn 2"),
            Ticket(name: "Project 3", pattern: "Pattern 3", yarn: "Yarn 3")
        ]
        return ContentView(tickets: tickets)
    }
}
