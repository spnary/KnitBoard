//
//  ContentView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var backlog: Backlog
    var menuOptions: [String] = [
        "Backlog",
        "Board"
    ]
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Button(action: {

                }) {
                    Text("+")
                }.padding()
                Spacer()
                Text("KnitBoard").font(.title)
                Spacer()
            }
            NavigationView() {
                List() {
                    NavigationLink(destination: BacklogView(backlog: backlog) ) {
                        Text("Backlog")
                    }
                    NavigationLink(destination: Text("Build the board here").frame(maxWidth: .infinity, maxHeight: .infinity)) {
                        Text("Board")
                    }
                }.frame(minWidth: 100, maxWidth: 200)
                }.navigationViewStyle(DoubleColumnNavigationViewStyle())
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
        let backlog = Backlog(tickets: tickets)
        return ContentView().environmentObject(backlog)
    }
}
