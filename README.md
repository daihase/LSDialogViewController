# LSDialogViewController

[![CI Status](http://img.shields.io/travis/daihase/LSDialogViewController.svg?style=flat)](https://travis-ci.org/daihase/LSDialogViewController)
[![Version](https://img.shields.io/cocoapods/v/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)
[![License](https://img.shields.io/cocoapods/l/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)
[![Platform](https://img.shields.io/cocoapods/p/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)


`LSDialogViewController` is able to easily display a custom view as a dialog.

![LSDialogViewController_animation](https://raw.github.com/wiki/daihase/resource_manage/gifs/LSDialogViewController_animation.gif)

# Requirement
- Swift 2+
- iOS 8.0+

# Installation

### From CocoaPods

LSDialogViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
# for Swift 3
pod 'LSDialogViewController', '~> 0.1.9'

# for Swift 2
pod 'LSDialogViewController', '0.1.0'
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
