![macOS](https://img.shields.io/badge/macOS-white?style=for-the-badge&logo=apple&logoColor=black)
![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=xcode&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-33c5ff?style=for-the-badge&logo=swift&logoColor=white)
![GitHub Created At](https://img.shields.io/github/created-at/Guliveer/MacOS-Calculator?style=for-the-badge)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/perez987/MacOS-Calculator/main?style=for-the-badge&color=blue)

# MacOS-Calculator 🎛️

This fork is based on [Guliveer/MacOS-Calculator](https://github.com/Guliveer/MacOS-Calculator). The main differences are:

- The Xcode project and app source were moved under `Xcode-project/`
- The app target was updated to version 1.1.0, with Apple Development signing configured and macOS 13.5 set as its deployment target
- The unit-test and UI-test targets and their test source files were removed
- Two additional app icon sets were added; existing project and asset files moved with the project
- The calculator window grew from 400 × 510 to 430 × 550 points
- The window now has a title and uses the standard title bar instead of a hidden title ba
- The blur material changed from `contentBackground` to `headerView` for a more transparent appearance.
- Button colors were moved into named `Color` extensions.

# Original README

**MacOS-Calculator** is my attempt to clone Apple's macOS calc. The app utilizes SwiftUI technologies, offering a clean and functional design for basic arithmetic operations.

## ✨ Features

- **Basic arithmetic operations**: addition, subtraction, multiplication, division.
- **Functional buttons**: clear, toggle sign, percentage.
- **Sleek UI** with a "frosted glass" effect that matches macOS design guidelines.
- **Keyboard input support**, making it easy to use with the keyboard as well.

## 🚀 How to Run

1. **Clone the repository:**
   To get started, clone this repository to your local machine:

   ```bash
   git clone https://github.com/perez987/MacOS-Calculator.git
   ```

2. **Set up the project:**
   Ensure that you have Xcode installed, along with Swift development tools. Open the project in Xcode.

3. **Run the app:**
   Once the project is open in Xcode, press `Cmd + R` to build and run the app on the simulator or a real device.

   ### You can also download by clicking [here](https://github.com/perez987/MacOS-Calculator/releases/latest/download/MacOS-Calculator.dmg) or through the releases section.

## 👁️ Take a quick look

|                     This                      |                          Apple's                          |
| :-------------------------------------------: | :-------------------------------------------------------: |
| ![My MacOS Calculator](./screenshots/app.png) | ![Apple's MacOS Calculator](./screenshots/apple_calc.png) |

See the calculator in action! The "frosted glass" effect gives it a clean and polished look, while the button layout ensures smooth interaction.

## 🖥️ Technologies

- **Swift** and **SwiftUI**: Using Apple's modern programming language and UI framework, I've tried to replicate the native macOS calculator's functionality, design, and user experience. All that while keeping the codebase clean and maintainable.

## ⚙️ Future Features

- **Expanded functionality**: Adding more advanced mathematical operations such as square roots, powers, and logarithms.
- **Dark mode**: Support for system-wide dark/light mode preferences.
- **Customization options**: Ability to personalize the calculator's appearance.
