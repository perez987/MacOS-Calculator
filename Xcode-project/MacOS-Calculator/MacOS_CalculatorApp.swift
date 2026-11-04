//
//  MacOS_CalculatorApp.swift
//  MacOS-Calculator
//
//  Created by Oliwer Pawelski on 20/11/2024.
//

import SwiftUI

@main
struct MacOS_CalculatorApp: App {
    init() {
        // Set permanent dark mode
        NSApplication.shared.appearance = NSAppearance(named: .vibrantDark)
    }

    var body: some Scene {
        
//        WindowGroup { // File -> New Window opens a new calculator
        
        Window("MacOS Calculator", id: "calc") { // Single windo app, app exits when closing main window
                
            ContentView()
        }
        
//      .defaultSize(width: 400, height: 510)
        
        // Integrated titlebar without text, comment this line to have app name in TitleBar
//        .windowStyle(HiddenTitleBarWindowStyle())
        
               // Comment .commands block, window is resizable despite this command
//                .commands {
//                    CommandGroup(replacing: .windowSize) {} // Disable window resizing
//                }
        
                // To have a truly non-resizable window
                .windowResizability(.contentSize) // Set the resizability option to the content size
    }
    
}


/*
 Console warnings at build:
 Failed to get or decode unavailable reasons
 Can't find or decode disabled use cases
 Can't find or decode reasons
 */
