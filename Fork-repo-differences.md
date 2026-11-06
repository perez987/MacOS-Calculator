# Differences from the source repository

This fork is based on [Guliveer/MacOS-Calculator](https://github.com/Guliveer/MacOS-Calculator). The comparison below is between the `main` branches as of November 6, 2026: source commit `eb57755` and this repository's commit `75a17ad`. At that point, this fork was 14 commits ahead of the source and had no commits to merge from it.

## Project and build

- The Xcode project and app source were moved under `Xcode-project/`.
- The app target was updated to version 1.1.0, with Apple Development signing configured and macOS 13.5 set as its deployment target.
- The unit-test and UI-test targets and their test source files were removed.
- Two additional app icon sets (`AppIcon4` and `AppIcon5`) were added; existing project and asset files moved with the project.

## App changes

- The calculator window grew from 400 × 510 to 430 × 550 points.
- The window now has a title and uses the standard title bar instead of a hidden title bar.
- The blur material changed from `contentBackground` to `headerView` for a more transparent appearance.
- Button colors were moved into named `Color` extensions.

## Repository and documentation

- `README.md` now credits and links to the source project, points clone and release-download instructions at this fork, and uses this fork's last-commit badge.
- `.gitignore` was replaced with a shorter set of OS metadata and Xcode state/build ignores.

These are fork-specific changes; the calculator's core arithmetic logic remains unchanged from the source at the compared revisions.
