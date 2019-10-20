//
//  BacklogView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct BacklogView: View {
    var body: some View {
        VStack() {
            TicketView()
            TicketView()
        }
    }
}

struct BacklogView_Previews: PreviewProvider {
    static var previews: some View {
        BacklogView()
    }
}
