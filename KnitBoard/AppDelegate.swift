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
        
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let backlogURL = documentURL.appendingPathComponent("backlog.json")
        var backlog: Backlog?
        do {
            backlog = try Backlog.backlog(from: backlogURL)
        } catch {
            backlog = Backlog(tickets: []) // if backlog.json isn't found, we'll initialize with no tickets
        }
        guard let initialBacklog = backlog else { return }
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(initialBacklog).frame(minWidth: 1000, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)

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

