//
//  PropertyView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct PropertyView: View {
    var propertyName: String
    var propertyValue: String
    var body: some View {
        HStack() {
            Text("\(propertyName): ")
            Text(propertyValue)
        }
    }
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView(propertyName: "Name", propertyValue: "My Knitting Project")
    }
}
