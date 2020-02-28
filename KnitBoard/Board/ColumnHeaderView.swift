//
//  ColumnHeaderView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 2/27/20.
//  Copyright © 2020 Stephen Nary. All rights reserved.
//

import SwiftUI

struct ColumnHeaderView: View {
    var status: TicketStatus
    var body: some View {
        Text(status.description).frame(maxWidth: .infinity)
    }
}

struct ColumnHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnHeaderView(status: .readyToKnit)
    }
}
