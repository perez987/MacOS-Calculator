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

            formatter.locale = Locale(identifier: "en_US") // Enforce using `.` as decimal separator
            // Because of current data input logic `.` has to be a decimal separator (I'll maybe fix this later).
            // [Example and explanation]
            // When the result is 0,5 and you try to add 1 (i.e. 0,5+1) you don't include that 0,5
            //   in calculation because `,` is not interpreted correctly.
            // Therefore if you want to include previous result (which includes decimals) in your next calculation
            //   it has to have `.` rather than `,`
            
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
