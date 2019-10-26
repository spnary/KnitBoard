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
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Spacer()
                Text("KnitBoard").font(.title)
                Spacer()
            }
            Button(action: {
                self.addTicket()
            }) {
                Text("+")
            }.padding([.leading])
            
            TabView() {
                BacklogView().environmentObject(backlog).tabItem(){
                    Text("Backlog")
                }
                BoardView()
                    .tabItem(){
                        Text("Board")
                }
            }
        }
    }
    
    func addTicket() {
        let newTicket = Ticket(name: "", pattern: "", yarn: "")
        backlog.tickets.append(newTicket)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(testBacklog).colorScheme(.dark)
            ContentView().environmentObject(testBacklog).colorScheme(.light)
        }
    }
}
