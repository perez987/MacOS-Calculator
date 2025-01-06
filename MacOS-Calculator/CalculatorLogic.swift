//
//  CalculatorLogic.swift
//  MacOS-Calculator
//
//  Created by Oliwer Pawelski on 20/11/2024.
//

import Foundation

extension ContentView {
    func buttonTapped(_ button: String) {
        if "0"..."9" ~= button || button == "." {
            if shouldResetDisplay {
                display = button == "." ? "0." : button
                shouldResetDisplay = false
            } else {
                display = display == "0" && button != "." ? button : display + button
            }
        } else {
            operationTapped(button)
        }
    }

    func numberTapped(_ number: String) {
        if shouldResetDisplay {
            display = number
            shouldResetDisplay = false
        } else {
            display = display == "0" ? number : display + number
        }
    }

    func operationTapped(_ operation: String) {
        switch operation {
        // Add "c" to capture uppercase and lowercase c from keyboard
        case "C","c":
            clear()
        case "+/-":
            toggleSign()
        case "%":
            percentage()
        case "+", "-", "x", "/":
            setOperation(operation)
        case "=":
            calculateResult()
        default:
            break
        }
    }

    func clear() {
        display = "0"
        firstOperand = nil
        currentOperation = nil
        shouldResetDisplay = false
    }

    func toggleSign() {
        if let value = Double(display) {
            display = String(-value)
        }
    }

    func percentage() {
        if let value = Double(display) {
            display = String(value / 100)
        }
    }

    func setOperation(_ operation: String) {
        firstOperand = Double(display)
        currentOperation = operation
        shouldResetDisplay = true
    }

    func calculateResult() {
        if let firstOperand = firstOperand,
           let secondOperand = Double(display),
           let operation = currentOperation {
            var outcome = "Error"
            
            switch operation {
            case "+":
                outcome = String(firstOperand + secondOperand)
            case "-":
                outcome = String(firstOperand - secondOperand)
            case "x":
                outcome = String(firstOperand * secondOperand)
            case "/":
                if secondOperand != 0 {
                    outcome = String(firstOperand / secondOperand)
                }
            default:
                break
            }
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2

            //let idioma = Bundle.main.preferredLocalizations[0] // This is the app language
             let idioma = NSLocale.current.identifier  // This is the device (macOS) language
             if idioma.contains("ES") {
                 formatter.locale = Locale(identifier: "es_ES") // Enforce using `,` as thousands separator and '.' as decimal separator
             }
             else {
                 formatter.locale = Locale(identifier: "en_EN") // Enforce using `.` as thousands separator and ',' as decimal separator
             }
            
            var outcomeDouble = 0.0
            
            if outcome != "Error" {
                outcomeDouble = Double(outcome)!
            }

            if let formattedNumber = formatter.string(from: NSNumber(value: outcomeDouble)) {
                if outcome != "Error" {
                    display = String(formattedNumber)
                } else {
                    display = outcome
                }
            }
            
            self.firstOperand = nil
            self.currentOperation = nil
            self.shouldResetDisplay = true
        }
    }
}
