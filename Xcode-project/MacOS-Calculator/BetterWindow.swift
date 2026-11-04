//
//  AppDelegate.swift
//  MacOS-Calculator
//
//  Created by Oliwer Pawelski on 20/11/2024.
//

// UNUSED, YET

import Cocoa
import SwiftUI

//@main
class BetterWindow: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView()

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 450),
            styleMask: [.titled, .fullSizeContentView], // Style dla zintegrowanego paska tytułu
            backing: .buffered,
            defer: true
        )
        window.isOpaque = false
        window.backgroundColor = .clear
        window.center()
        window.title = "Calculator"
        window.isMovableByWindowBackground = true
        window.titlebarAppearsTransparent = true // Zintegrowany pasek tytułu

        window.contentView = NSHostingController(rootView: contentView).view

        window.makeKeyAndOrderFront(nil)
        // Blokowanie rozmiaru okna
        window.styleMask.remove(.resizable) // Usuwamy możliwość zmiany rozmiaru
    }
}

