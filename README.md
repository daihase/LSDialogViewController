# LSDialogViewController

[![CI Status](http://img.shields.io/travis/daihase/LSDialogViewController.svg?style=flat)](https://travis-ci.org/daihase/LSDialogViewController)
[![Version](https://img.shields.io/cocoapods/v/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)
[![License](https://img.shields.io/cocoapods/l/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)
[![Platform](https://img.shields.io/cocoapods/p/LSDialogViewController.svg?style=flat)](http://cocoapods.org/pods/LSDialogViewController)


## Installation

### From CocoaPods

LSDialogViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LSDialogViewController"
```
## Usage
To run the example project, clone the repo, and run `pod install` from the Example directory first.

#### Examples

```swift

import LSDialogViewController
// to show the dialog
let dialogViewController: CustomDialogViewController = CustomDialogViewController(nibName:"CustomDialog", bundle: nil)
dialogViewController.delegate = self
self.presentDialogViewController(dialogViewController, animationPattern: animationPattern, backgroundViewType: backgroundViewType, dismissButtonEnabled: Bool, completion: { () -> Void in })

// to dismiss the dialog
self.dismissDialogViewController(animationPattern)
```

## License

LSDialogViewController is available under the MIT license. See the LICENSE file for more info.
