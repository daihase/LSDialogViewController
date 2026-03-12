<div style="text-align: center; width: 100%">
<img src="Documents/LSDialogViewController.png" width: 100% height: 100% alt="LSDialogViewController Logo">
</div>

[![Language: Swift 5.0](https://img.shields.io/badge/swift-5.0-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
[![License](https://img.shields.io/cocoapods/l/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)
[![Platform](https://img.shields.io/cocoapods/p/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)
[![CocoaPodsDL](https://img.shields.io/badge/Cocoa%20Pods-%E2%9C%93-4BC51D.svg?style=flat)](https://cocoapods.org/pods/LSDialogViewController)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


`LSDialogViewController` makes it easy to display a custom view as a dialog with various animation patterns.

![LSDialogViewController_animation](https://raw.github.com/wiki/daihase/resource_manage/gifs/LSDialogViewController_animation.gif)

# Requirements
- Swift 5.0+
- iOS 12.0+

# Installation

### Swift Package Manager (Recommended)

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/daihase/LSDialogViewController.git", from: "4.1")
]
```

Or in Xcode: **File → Add Package Dependencies...** → Enter the repository URL:

```
https://github.com/daihase/LSDialogViewController.git
```

### CocoaPods

LSDialogViewController is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'LSDialogViewController', '~> 4.0'
```

### Carthage

Add the following to your `Cartfile`:

```ruby
github "daihase/LSDialogViewController"
```

Then run:

```
$ carthage update
```

# Usage

To run the example project, clone the repo and run `pod install` from the `Example` directory.
There is also an SPM-based example in the `ExampleSPM` directory — just open `ExampleSPM.xcodeproj` and build.

#### Examples

```swift
import LSDialogViewController

// Show a dialog
let dialogViewController = CustomDialogViewController(nibName: "CustomDialog", bundle: nil)
dialogViewController.delegate = self
presentDialogViewController(dialogViewController, animationPattern: .fadeInOut)

// Dismiss the dialog
dismissDialogViewController(.fadeInOut)
```

# Configuration

```swift
presentDialogViewController(
    // Required: the view controller to display as a dialog
    dialogViewController: UIViewController,
    // Animation pattern (default: .fadeInOut)
    animationPattern: LSAnimationPattern,
    // Background view type (default: .solid)
    backgroundViewType: LSDialogBackgroundViewType,
    // Whether tapping the background dismisses the dialog (default: true)
    dismissButtonEnabled: Bool,
    // Called after the dialog is presented
    completion: (() -> Swift.Void)?
)
```

### Background View Types

You can choose from `.solid`, `.gradient`, or `.none`:

![Image][1]
.
![Image][2]

## License

LSDialogViewController is available under the MIT license. See the LICENSE file for more info.


[1]:
https://raw.github.com/wiki/daihase/resource_manage/gifs/zoominout_gradient.gif
[2]:
https://raw.github.com/wiki/daihase/resource_manage/gifs/slide-bottombottom_none.gif
