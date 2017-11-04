//
//  LSDialogViewController.swift
//  LSDialogViewController
//
//  Created by Daisuke Hasegawa on 2016/05/15.
//  Copyright © 2016年 Libra Studio, Inc. All rights reserved.
//

import UIKit

let LSSourceViewTag: Int = 997
let LSDialogViewTag: Int = 998
let LSOverlayViewTag: Int = 999

var kDialogViewController: UInt8 = 0
var kDialogBackgroundView: UInt8 = 1

public extension UIViewController {
    
    var ls_dialogViewController: UIViewController? {
        get {
            return objc_getAssociatedObject(self, &kDialogViewController) as? UIViewController
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kDialogViewController, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var ls_dialogBackgroundView: LSDialogBackgroundView? {
        get {
            return objc_getAssociatedObject(self, &kDialogBackgroundView) as? LSDialogBackgroundView
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kDialogBackgroundView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func presentDialogViewController(_ dialogViewController: UIViewController, animationPattern: LSAnimationPattern = .fadeInOut, backgroundViewType: LSDialogBackgroundViewType = .solid, dismissButtonEnabled: Bool = true, completion: (() -> Swift.Void)? = nil) {
        
        // get the view of viewController that called the dialog.
        let sourceView: UIView = self.getSourceView()
        self.ls_dialogViewController = dialogViewController
        sourceView.tag = LSSourceViewTag
        
        // dialog View.
        let dialogView: UIView = ls_dialogViewController!.view
        dialogView.autoresizingMask = [.flexibleBottomMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleRightMargin]
        dialogView.alpha = 0.0
        dialogView.tag = LSDialogViewTag
        
        if sourceView.subviews.contains(dialogView) {
            return
        }
        
        let overlayView: UIView = UIView(frame: sourceView.bounds)
        overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlayView.backgroundColor = UIColor.clear
        overlayView.tag = LSOverlayViewTag
        
        // background View.
        self.ls_dialogBackgroundView = LSDialogBackgroundView(frame: sourceView.bounds)
        self.ls_dialogBackgroundView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.ls_dialogBackgroundView!.backgroundColor = UIColor.clear
        self.ls_dialogBackgroundView!.backgroundViewType = backgroundViewType
        self.ls_dialogBackgroundView!.alpha = 0.0
        if let _ = self.ls_dialogBackgroundView {
            overlayView.addSubview(self.ls_dialogBackgroundView!)
        }
        
        // dismiss button.
        let dismissButton: UIButton = UIButton(type: .custom)
        dismissButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dismissButton.backgroundColor = UIColor.clear
        dismissButton.frame = sourceView.bounds
        dismissButton.tag = animationPattern == LSAnimationPattern.fadeInOut ? LSAnimationPattern.fadeInOut.rawValue : animationPattern.rawValue
        dismissButton.addTarget(self, action: #selector(UIViewController.tapLSDialogBackgroundView(_:)), for: .touchUpInside)
        dismissButton.isEnabled = dismissButtonEnabled
        
        // add view.
        overlayView.addSubview(dismissButton)
        overlayView.addSubview(dialogView)
        sourceView.addSubview(overlayView)
        
        // set animation pattern and call.
        LSAnimationUtils.sharedInstance.startAnimation(self, dialogView: dialogView, sourceView: sourceView, overlayView: overlayView, animationPattern: animationPattern)
        
        // called after the dialog display.
        completion?()
   }
    
    // close dialog.
    func dismissDialogViewController(_ animationPattern: LSAnimationPattern = .fadeInOut) {
        let sourceView: UIView = self.getSourceView()
        let dialogView: UIView = sourceView.viewWithTag(LSDialogViewTag)!
        let overlayView: UIView = sourceView.viewWithTag(LSOverlayViewTag)!
        
        // set animation pattern and call.
        LSAnimationUtils.sharedInstance.endAnimation(dialogView, sourceView: sourceView, overlayView: overlayView, animationPattern: animationPattern)
    }
    
    // Close the dialog by tapping the background.
    @objc func tapLSDialogBackgroundView(_ dismissButton: UIButton) {
        let animationPattern: LSAnimationPattern = LSAnimationPattern(rawValue: dismissButton.tag)!
        self.dismissDialogViewController(animationPattern)
    }
    
    func getSourceView() -> UIView {
        var sourceViewController: UIViewController = self
        if let _ = sourceViewController.parent {
            sourceViewController = sourceViewController.parent!
        }
        return sourceViewController.view
    }
}
