//
//  LSAnimationUtils.swift
//  LSDialogViewController
//
//  Created by Daisuke Hasegawa on 2016/05/15.
//  Copyright © 2016年 Libra Studio, Inc. All rights reserved.
//

import UIKit

// Animation Pattern
public enum LSAnimationPattern: Int {
    case fadeInOut
    case zoomInOut
    case slideBottomBottom
    case slideBottomTop
    case slideLeftLeft
    case slideLeftRight
    case slideTopTop
    case slideTopBottom
    case slideRightRight
    case slideRightLeft
}

open class LSAnimationUtils {
    weak var parentViewController: UIViewController?
    open var animationDuration = 0.2
    static let shared = LSAnimationUtils()
    private init() {}
    
    open func startAnimation(_ parentViewController: UIViewController, dialogView: UIView, sourceView: UIView, overlayView: UIView, animationPattern: LSAnimationPattern) {
        self.parentViewController = parentViewController
        // Slide Pattern
        switch animationPattern {
        case .slideBottomBottom,
             .slideBottomTop,
             .slideLeftLeft,
             .slideLeftRight,
             .slideTopTop,
             .slideTopBottom,
             .slideRightRight,
             .slideRightLeft:
            self.slideInAnimation(dialogView, sourceView: sourceView, overlayView: overlayView, animationPattern: animationPattern)
        // Zoom Pattern
        case .zoomInOut:
            self.zoomInAnimation(dialogView, sourceView: sourceView, overlayView: overlayView)
        default:
            // Fade Pattern
            self.fadeInAnimation(dialogView, sourceView: sourceView, overlayView: overlayView)
        }
    }
    
    open func endAnimation(_ dialogView: UIView, sourceView: UIView, overlayView: UIView, animationPattern: LSAnimationPattern) {
        switch animationPattern {
        // Slide Pattern
        case .slideBottomBottom,
             .slideBottomTop,
             .slideLeftLeft,
             .slideLeftRight,
             .slideTopTop,
             .slideTopBottom,
             .slideRightRight,
             .slideRightLeft:
            self.slideOutAnimation(dialogView, sourceView: sourceView, overlayView: overlayView, animationPattern: animationPattern)
        // Zoom Pattern
        case .zoomInOut:
            self.zoomOutAnimation(dialogView, sourceView: sourceView, overlayView: overlayView)
        default:
            // Fade Pattern
            self.fadeOutAnimation(dialogView, sourceView: sourceView, overlayView: overlayView)
        }
    }
    
    open func slideInAnimation(_ dialogView: UIView, sourceView: UIView, overlayView: UIView, animationPattern: LSAnimationPattern) {
        let sourceSize = sourceView.bounds.size
        let dialogSize = dialogView.bounds.size
        var dialogStartRect: CGRect
        
        switch animationPattern {
        case .slideBottomTop,
             .slideBottomBottom:
            dialogStartRect = CGRect(x: (sourceSize.width - dialogSize.width) / 2, y: sourceSize.height, width: dialogSize.width, height: dialogSize.height)
        case .slideLeftLeft,
             .slideLeftRight:
            dialogStartRect = CGRect(x: -sourceSize.width, y: (sourceSize.height - dialogSize.height) / 2, width: dialogSize.width, height: dialogSize.height)
        case .slideTopTop,
             .slideTopBottom:
            dialogStartRect = CGRect(x: (sourceSize.width - dialogSize.width) / 2, y: -sourceSize.height, width: dialogSize.width, height: dialogSize.height)
        default:
            dialogStartRect = CGRect(x: sourceSize.width, y: (sourceSize.height - dialogSize.height) / 2, width: dialogSize.width, height: dialogSize.height)
        }
        
        let dialogEndRect = CGRect(x: (sourceSize.width - dialogSize.width) / 2, y: (sourceSize.height - dialogSize.height) / 2, width: dialogSize.width, height: dialogSize.height)
        dialogView.frame = dialogStartRect
        dialogView.alpha = 1.0
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController?.viewWillAppear(false)
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 1.0
            dialogView.frame = dialogEndRect
        }, completion: { (finished) -> Void in
            self.parentViewController?.ls_dialogViewController?.viewDidAppear(false)
        })
    }
    
    open func slideOutAnimation(_ dialogView: UIView, sourceView: UIView, overlayView: UIView, animationPattern: LSAnimationPattern) {
        let sourceSize = sourceView.bounds.size
        let dialogSize = dialogView.bounds.size
        var dialogEndRect: CGRect
        
        switch animationPattern {
        case .slideBottomTop,
             .slideTopTop:
            dialogEndRect = CGRect(x: (sourceSize.width - dialogSize.width) / 2, y: -dialogSize.height, width: dialogSize.width, height: dialogSize.height)
        case .slideBottomBottom,
             .slideTopBottom:
            dialogEndRect = CGRect(x: (sourceSize.width - dialogSize.width) / 2, y: dialogSize.height, width: dialogSize.width, height: dialogSize.height)
        case .slideLeftRight,
             .slideRightRight:
            dialogEndRect = CGRect(x: sourceSize.width, y: dialogView.frame.origin.y, width: dialogSize.width, height: dialogSize.height)
        default:
            dialogEndRect = CGRect(x: -dialogSize.width, y: dialogView.frame.origin.y, width: dialogSize.width, height: dialogSize.height)
        }
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 0.0
            dialogView.frame = dialogEndRect
        }) { (finished) -> Void in
            UIView.animate(withDuration: self.animationDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
                self.parentViewController?.ls_dialogViewController?.viewWillDisappear(false)
            }) { (finished) -> Void in
                dialogView.removeFromSuperview()
                overlayView.removeFromSuperview()
                self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
                self.parentViewController?.ls_dialogViewController = nil
            }
        }
    }
    
    open func fadeInAnimation(_ dialogView: UIView, sourceView: UIView, overlayView: UIView) {
        let sourceSize = sourceView.bounds.size
        let dialogSize = dialogView.bounds.size
        dialogView.frame = CGRect(x: (sourceSize.width - dialogSize.width) / 2,
                                  y: (sourceSize.height - dialogSize.height) / 2,
                                  width: dialogSize.width,
                                  height: dialogSize.height)
        dialogView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        dialogView.alpha = 0.0
        
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController!.viewWillAppear(false)
            self.parentViewController?.ls_dialogBackgroundView!.alpha = 1.0
            dialogView.transform = CGAffineTransform.identity
            dialogView.alpha = 1.0
            }, completion: { (finished) -> Void in
                self.parentViewController?.ls_dialogViewController?.viewDidAppear(false)
        })
    }
    
    open func fadeOutAnimation(_ dialogView: UIView, sourceView: UIView, overlayView: UIView) {
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 0.0
            dialogView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            dialogView.alpha = 0.0
            }, completion: { (finished) -> Void in
                dialogView.removeFromSuperview()
                overlayView.removeFromSuperview()
                self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
                self.parentViewController?.ls_dialogViewController = nil
        })
    }
    
    open func zoomInAnimation(_ dialogView: UIView, sourceView: UIView, overlayView: UIView) {
        let sourceSize = sourceView.bounds.size
        let dialogSize = dialogView.bounds.size
        dialogView.frame = CGRect(x: (sourceSize.width - dialogSize.width) / 2,
                                  y: (sourceSize.height - dialogSize.height) / 2,
                                  width: dialogSize.width,
                                  height: dialogSize.height)
        dialogView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        dialogView.alpha = 0.0
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController?.viewWillAppear(false)
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 1.0
            dialogView.transform = CGAffineTransform.identity
            dialogView.alpha = 1.0
        }) { (finished) -> Void in
            self.parentViewController?.ls_dialogViewController?.viewDidAppear(false)
        }
    }
    
    open func zoomOutAnimation(_ dialogView: UIView, sourceView: UIView, overlayView: UIView) {
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 0.0
            dialogView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            dialogView.alpha = 0.0
        }) { (finished) -> Void in
            dialogView.removeFromSuperview()
            overlayView.removeFromSuperview()
            self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
            self.parentViewController?.ls_dialogViewController = nil
        }
    }
}
