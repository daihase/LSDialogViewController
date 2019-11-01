<div style="text-align: center; width: 100%">
<img src="Documents/LSDialogViewController.png" width: 100% height: 100% alt="LSDialogViewController Logo">
</div>

[![Language: Swift 5.0](https://img.shields.io/badge/swift-5.0-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
[![License](https://img.shields.io/cocoapods/l/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)
[![Platform](https://img.shields.io/cocoapods/p/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)
[![CocoaPodsDL](https://img.shields.io/badge/Cocoa%20Pods-%E2%9C%93-4BC51D.svg?style=flat)](https://cocoapods.org/pods/LSDialogViewController)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


`LSDialogViewController` is able to easily display a custom view as a dialog.

![LSDialogViewController_animation](https://raw.github.com/wiki/daihase/resource_manage/gifs/LSDialogViewController_animation.gif)

# Requirement
- Swift 2+ (**Swift 4.2 is ready** :thumbsup:)
- iOS 8.0+

# Installation

### From CocoaPods

LSDialogViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
# for Swift 4.2
pod 'LSDialogViewController', '~> 3.0'

# for Swift 3
pod 'LSDialogViewController', '~> 0.1.9'

# for Swift 2
pod 'LSDialogViewController', '0.1.0'
```

### From Carthage

Add this to Cartfile.
```ruby
github "daihase/LSDialogViewController"
```

And then, run this command.
```ruby
$ carthage update
```


# Usage
To run the example project, clone the repo, and run `pod install` from the Example directory first.


#### Examples

```swift

import LSDialogViewController
// to show the dialog
let dialogViewController: CustomDialogViewController = CustomDialogViewController(nibName:"CustomDialog", bundle: nil)
dialogViewController.delegate = self
self.presentDialogViewController(dialogViewController, animationPattern: animationPattern, completion: { () -> Void in })

// to dismiss the dialog
self.dismissDialogViewController(animationPattern)
```

# Configuration
```swift
presentDialogViewController(
  // required
  dialogViewController: :UIViewController,
  // default LSAnimationPattern.FadeInOut
  animationPattern: LSAnimationPattern,
  // default LSDialogBackgroundViewType.Solid
  backgroundViewType: LSDialogBackgroundViewType,
  // default true
  dismissButtonEnabled: Bool,
  // optional
  completion: (() -> Swift.Void)?
)
```
Other background view type. (.Gradient .None)

![Image][1]
.
![Image][2]

## License

LSDialogViewController is available under the MIT license. See the LICENSE file for more info.


[1]:
https://raw.github.com/wiki/daihase/resource_manage/gifs/zoominout_gradient.gif
[2]:
https://raw.github.com/wiki/daihase/resource_manage/gifs/slide-bottombottom_none.gif
