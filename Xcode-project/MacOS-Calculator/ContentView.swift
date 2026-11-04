//
//  ContentView.swift
//  MacOS-Calculator
//
//  Created by Oliwer Pawelski on 20/11/2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var display = "0"
    @State var firstOperand: Double?
    @State var currentOperation: String?
    @State var shouldResetDisplay = false
    @State private var activeKey: String? = nil

    let buttons: [[String]] = [
        ["C", "+/-", "%", "/"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]

    var body: some View {
        ZStack {
            // Frosted Glass Effect
            Color.clear
                .background(VisualEffectBlur())
            
            VStack(spacing: 10) {
                // Display
                Text(display)
                    .font(.system(size: 40))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .background(.clear)

                // Buttons Grid
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { button in
                            Button(action: {buttonTapped(button)} ) {
                                Text(button)
                                    .font(.system(size: 28))
                                    .frame(width: button == "0" ? 166 : 70, height: 70)
                                    .background(.clear)
                                    .foregroundColor(.white)
                            }.background(buttonColor(for: button))
                                .cornerRadius(100)
                        }
                    }
                }
            }
        }
        .frame(width: 400, height: 510)
        .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
            NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
                if event.type == .keyDown { // Filter only keyDown event
                    handleKeyPress(event: event)
                }
                return event
            }
        }
    }
    
    // Buttons' colors
    func buttonColor(for button: String) -> Color {
        if ["+", "-", "x", "/", "="].contains(button) {
            return Color.Orange
        } else if ["C", "+/-", "%"].contains(button) {
            return Color.Gray
        } else {
            return Color.DarkGray
        }
    }
    
    // Handling keyboard
    func handleKeyPress(event: NSEvent) {
        guard let characters = event.characters else { return }

        // Add "C" and "c" to capture uppercase and lowercase c from keyboard
        let validKeys = ["C", "c", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "+", "-", "/", "x", "*", "=", "\r"]
                         if validKeys.contains(characters) {
            let normalizedKey = characters == "*" ? "x" : (characters == "\r" ? "=" : characters)
            
            // Set active key (for visuals)
            activeKey = normalizedKey
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                activeKey = nil
            }
            
            // Button handling
            buttonTapped(normalizedKey)
        }
    }
}

#Preview {
    ContentView()
}
