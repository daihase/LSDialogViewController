//
//  LSAnimationUtils.swift
//  LSDialogViewController
//
//  Created by Daisuke Hasegawa on 2016/05/15.
//  Copyright © 2016年 Libra Studio, Inc. All rights reserved.
//

import UIKit

// Animation Pattern.
public enum LSAnimationPattern: Int {
    case FadeInOut
    case ZoomInOut
    case SlideBottomBottom
    case SlideBottomTop
    case SlideLeftLeft
    case SlideLeftRight
    case SlideTopTop
    case SlideTopBottom
    case SlideRightRight
    case SlideRightLeft
}

public class LSAnimationUtils: NSObject {
    
    weak var parentViewController: UIViewController?
    let animationDuration = 0.2
    
    class var sharedInstance : LSAnimationUtils {
        struct Static {
            static let instance : LSAnimationUtils = LSAnimationUtils()
        }
        return Static.instance
    }
    
    func startAnimation(parentViewController: UIViewController, dialogView: UIView, sourceView: UIView, overlayView: UIView, animationPattern: LSAnimationPattern) {
        
        self.parentViewController = parentViewController
        
        switch animationPattern {
        // Slide Pattern.
        case .SlideBottomBottom, .SlideBottomTop, .SlideLeftLeft, .SlideLeftRight, .SlideTopTop, .SlideTopBottom, .SlideRightRight, .SlideRightLeft:
            
            self.slideInAnimation(dialogView, sourceView: sourceView, overlayView: overlayView, animationPattern: animationPattern)
        // Zoom Pattern.
        case .ZoomInOut:
            self.zoomInAnimation(dialogView, sourceView: sourceView, overlayView: overlayView)
        default:
            // Fade Pattern.
            self.fadeInAnimation(dialogView, sourceView: sourceView, overlayView: overlayView)
        }
    }
    
    func endAnimation(dialogView: UIView, sourceView: UIView, overlayView: UIView, animationPattern: LSAnimationPattern) {
        
        switch animationPattern {
        // Slide Pattern.
        case .SlideBottomBottom, .SlideBottomTop, .SlideLeftLeft, .SlideLeftRight, .SlideTopTop, .SlideTopBottom, .SlideRightRight, .SlideRightLeft:
            self.slideOutAnimation(dialogView, sourceView: sourceView, overlayView: overlayView, animationPattern: animationPattern)
        // Zoom Pattern.
        case .ZoomInOut:
            self.zoomOutAnimation(dialogView, sourceView: sourceView, overlayView: overlayView)
        default:
            // Fade Pattern.
            self.fadeOutAnimation(dialogView, sourceView: sourceView, overlayView: overlayView)
        }
    }
    
    func slideInAnimation(dialogView: UIView, sourceView: UIView, overlayView: UIView, animationPattern: LSAnimationPattern) {
        
        let sourceSize: CGSize = sourceView.bounds.size
        let dialogSize: CGSize = dialogView.bounds.size
        var dialogStartRect:CGRect
        
        switch animationPattern {
        case .SlideBottomTop, .SlideBottomBottom:
            dialogStartRect = CGRectMake((sourceSize.width - dialogSize.width) / 2, sourceSize.height, dialogSize.width, dialogSize.height)
        case .SlideLeftLeft, .SlideLeftRight:
            dialogStartRect = CGRectMake(-sourceSize.width, (sourceSize.height - dialogSize.height) / 2, dialogSize.width, dialogSize.height)
        case .SlideTopTop, .SlideTopBottom:
            dialogStartRect = CGRectMake((sourceSize.width - dialogSize.width) / 2, -sourceSize.height, dialogSize.width, dialogSize.height)
        default:
            dialogStartRect = CGRectMake(sourceSize.width, (sourceSize.height - dialogSize.height) / 2, dialogSize.width, dialogSize.height)
        }
        
        let dialogEndRect:CGRect = CGRectMake((sourceSize.width - dialogSize.width)/2, (sourceSize.height - dialogSize.height)/2, dialogSize.width, dialogSize.height)
        dialogView.frame = dialogStartRect
        dialogView.alpha = 1.0
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController?.viewWillAppear(false)
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 1.0
            dialogView.frame = dialogEndRect
        }) { (finished) -> Void in
            self.parentViewController?.ls_dialogViewController?.viewDidAppear(false)
        }
    }
    
    func slideOutAnimation(dialogView: UIView, sourceView: UIView, overlayView: UIView, animationPattern: LSAnimationPattern) {
        
        let sourceSize: CGSize = sourceView.bounds.size
        let dialogSize: CGSize = dialogView.bounds.size
        var dialogEndRect: CGRect
        
        switch animationPattern {
        case .SlideBottomTop, .SlideTopTop:
            dialogEndRect = CGRectMake((sourceSize.width - dialogSize.width) / 2, -dialogSize.height, dialogSize.width, dialogSize.height)
        case .SlideBottomBottom, .SlideTopBottom:
            dialogEndRect = CGRectMake((sourceSize.width - dialogSize.width)/2, dialogSize.height, dialogSize.width, dialogSize.height)
        case .SlideLeftRight, .SlideRightRight:
            dialogEndRect = CGRectMake(sourceSize.width, dialogView.frame.origin.y, dialogSize.width, dialogSize.height)
        default:
            dialogEndRect = CGRectMake(-dialogSize.width, dialogView.frame.origin.y, dialogSize.width, dialogSize.height)
        }
        
        UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 0.0
            dialogView.frame = dialogEndRect
        }) { (finished) -> Void in
            UIView.animateWithDuration(self.animationDuration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                self.parentViewController?.ls_dialogViewController?.viewWillDisappear(false)
                
            }) { (finished) -> Void in
                dialogView.removeFromSuperview()
                overlayView.removeFromSuperview()
                self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
                self.parentViewController?.ls_dialogViewController = nil
            }
        }
    }
    
    func fadeInAnimation(dialogView: UIView, sourceView: UIView, overlayView: UIView) {
        let sourceSize: CGSize = sourceView.bounds.size
        let dialogSize: CGSize = dialogView.bounds.size
        dialogView.frame = CGRectMake((sourceSize.width - dialogSize.width) / 2,
                                      (sourceSize.height - dialogSize.height) / 2,
                                      dialogSize.width,
                                      dialogSize.height)
        dialogView.transform = CGAffineTransformMakeScale(1.05, 1.05)
        dialogView.alpha = 0.0
        
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController!.viewWillAppear(false)
            self.parentViewController?.ls_dialogBackgroundView!.alpha = 1.0
            dialogView.transform = CGAffineTransformIdentity
            dialogView.alpha = 1.0
        }) { (finished) -> Void in
            self.parentViewController?.ls_dialogViewController?.viewDidAppear(false)
        }
    }
    
    func fadeOutAnimation(dialogView: UIView, sourceView: UIView, overlayView: UIView) {
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 0.0
            dialogView.transform = CGAffineTransformMakeScale(0.95, 0.95)
            dialogView.alpha = 0.0
        }) { (finished) -> Void in
            dialogView.removeFromSuperview()
            overlayView.removeFromSuperview()
            self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
            self.parentViewController?.ls_dialogViewController = nil
        }
    }
    
    func zoomInAnimation(dialogView: UIView, sourceView: UIView, overlayView: UIView) {
        let sourceSize: CGSize = sourceView.bounds.size
        let dialogSize: CGSize = dialogView.bounds.size
        dialogView.frame = CGRectMake((sourceSize.width - dialogSize.width) / 2,
                                      (sourceSize.height - dialogSize.height) / 2,
                                      dialogSize.width,
                                      dialogSize.height)
        dialogView.transform = CGAffineTransformMakeScale(0.01, 0.01)
        dialogView.alpha = 0.0
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController?.viewWillAppear(false)
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 1.0
            dialogView.transform = CGAffineTransformIdentity
            dialogView.alpha = 1.0
        }) { (finished) -> Void in
            self.parentViewController?.ls_dialogViewController?.viewDidAppear(false)
        }
    }
    
    func zoomOutAnimation(dialogView: UIView, sourceView: UIView, overlayView: UIView) {
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
            self.parentViewController?.ls_dialogBackgroundView?.alpha = 0.0
            dialogView.transform = CGAffineTransformMakeScale(0.01, 0.01)
            dialogView.alpha = 0.0
        }) { (finished) -> Void in
            dialogView.removeFromSuperview()
            overlayView.removeFromSuperview()
            self.parentViewController?.ls_dialogViewController?.viewDidDisappear(false)
            self.parentViewController?.ls_dialogViewController = nil
        }
    }
}