//
//  AppDelegate.swift
//  KnitBoard
//
//  Created by Stephen Nary on 10/20/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let testTickets = [
            Ticket(name: "Project 1", pattern: "Pattern 1", yarn: "Yarn 1"),
            Ticket(name: "Project 2", pattern: "Pattern 2", yarn: "Yarn 2"),
            Ticket(name: "Project 3", pattern: "Pattern 3", yarn: "Yarn 3"),
            Ticket(name: "Project 4", pattern: "Pattern 4", yarn: "Yarn 4")
        ]
        let backlog = Backlog(tickets: testTickets)
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(backlog)

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

