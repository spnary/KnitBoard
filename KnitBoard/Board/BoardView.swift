//
//  BoardView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/26/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    var statuses = TicketStatus.allCases
    @EnvironmentObject var backlog: Backlog
    var body: some View {
        ScrollView() {
            HStack(alignment: .top) {
                ForEach(statuses, id: \.self) { status in
                    BoardColumnView(status: status, tickets: self.$backlog.tickets )
                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView().environmentObject(testBacklog)
    }
}
