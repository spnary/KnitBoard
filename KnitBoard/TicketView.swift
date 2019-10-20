//
//  TicketView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        VStack(alignment: .leading) {
            PropertyView(propertyName: "Name", propertyValue: "myproject")
            PropertyView(propertyName: "Status", propertyValue: "Ready to Knit")
            PropertyView(propertyName: "Pattern", propertyValue: "a sweet pattern")
            PropertyView(propertyName: "Yarn", propertyValue: "Some soft merino")
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
