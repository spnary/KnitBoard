//
//  BoardView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/26/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    let columnSpacing: CGFloat = 5.0
    var statuses = TicketStatus.allCases
    @EnvironmentObject var backlog: Backlog
    var body: some View {
        GeometryReader { proxy in
            VStack() {
                HStack(alignment: .top, spacing: self.columnSpacing) {
                    ForEach(self.statuses, id: \.self){ status in
                        ColumnHeaderView(status: status)
                    }
                }
                ScrollView() {
                    HStack(alignment: .top, spacing: self.columnSpacing) {
                        ForEach(self.statuses, id: \.self) { status in
                            BoardColumnView(status: status, width: proxy.size.width/CGFloat(self.statuses.count) - 2 * self.columnSpacing ,tickets: self.$backlog.tickets )
                        }
                    }
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
