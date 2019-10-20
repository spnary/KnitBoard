//
//  ContentView.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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
                VStack() {
                    Text("Backlog")
                    Text("Board")
                }
                BacklogView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
