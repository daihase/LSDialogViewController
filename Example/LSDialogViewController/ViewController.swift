//
//  ViewController.swift
//  LSDialogViewController
//
//  Created by Daisuke Hasegawa on 2016/05/15.
//  Copyright © 2016年 Libra Studio, Inc. All rights reserved.
//

import UIKit
import LSDialogViewController

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapButtonFadeInFadeOut(sender: AnyObject) {
        self.showDialog(.FadeInOut)
    }
    
    @IBAction func tapButtonZoomInZoomOut(sender: AnyObject) {
        self.showDialog(.ZoomInOut)
    }
    
    @IBAction func tapButtonSlideBottomBottom(sender: AnyObject) {
        self.showDialog(.SlideBottomBottom)
    }
    
    @IBAction func tapButtonSlideBottomTop(sender: AnyObject) {
        self.showDialog(.SlideBottomTop)
    }
    
    @IBAction func tapButtonSlideLeftLeft(sender: AnyObject) {
        self.showDialog(.SlideLeftLeft)
    }
    
    @IBAction func tapButtonSlideLeftRight(sender: AnyObject) {
        self.showDialog(.SlideLeftRight)
    }
    
    @IBAction func tapButtonSlideTopTop(sender: AnyObject) {
        self.showDialog(.SlideTopTop)
    }
    
    @IBAction func tapButtonSlideTopBottom(sender: AnyObject) {
        self.showDialog(.SlideTopBottom)
        
    }
    
    @IBAction func tapButtonSlideRightRight(sender: AnyObject) {
        self.showDialog(.SlideRightRight)
    }
    
    @IBAction func tapButtonSlideRightLeft(sender: AnyObject) {
        self.showDialog(.SlideRightLeft)
    }
    
    private func showDialog(animationPattern: LSAnimationPattern) {
        let dialogViewController = CustomDialogViewController(nibName: "CustomDialog", bundle: nil)
        dialogViewController.delegate = self
        self.presentDialogViewController(dialogViewController, animationPattern: animationPattern, completion: {() -> Void in})
    }
    
    func dismissDialog() {
        self.dismissDialogViewController(LSAnimationPattern.FadeInOut)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

