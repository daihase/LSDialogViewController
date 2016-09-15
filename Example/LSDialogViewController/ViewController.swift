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
    
    @IBAction func tapButtonFadeInFadeOut(_ sender: AnyObject) {
        self.showDialog(.fadeInOut)
    }
    
    @IBAction func tapButtonZoomInZoomOut(_ sender: AnyObject) {
        self.showDialog(.zoomInOut)
    }
    
    @IBAction func tapButtonSlideBottomBottom(_ sender: AnyObject) {
        self.showDialog(.slideBottomBottom)
    }
    
    @IBAction func tapButtonSlideBottomTop(_ sender: AnyObject) {
        self.showDialog(.slideBottomTop)
    }
    
    @IBAction func tapButtonSlideLeftLeft(_ sender: AnyObject) {
        self.showDialog(.slideLeftLeft)
    }
    
    @IBAction func tapButtonSlideLeftRight(_ sender: AnyObject) {
        self.showDialog(.slideLeftRight)
    }
    
    @IBAction func tapButtonSlideTopTop(_ sender: AnyObject) {
        self.showDialog(.slideTopTop)
    }
    
    @IBAction func tapButtonSlideTopBottom(_ sender: AnyObject) {
        self.showDialog(.slideTopBottom)
        
    }
    
    @IBAction func tapButtonSlideRightRight(_ sender: AnyObject) {
        self.showDialog(.slideRightRight)
    }
    
    @IBAction func tapButtonSlideRightLeft(_ sender: AnyObject) {
        self.showDialog(.slideRightLeft)
    }
    
    fileprivate func showDialog(_ animationPattern: LSAnimationPattern) {
        let dialogViewController = CustomDialogViewController(nibName: "CustomDialog", bundle: nil)
        dialogViewController.delegate = self
        self.presentDialogViewController(dialogViewController, animationPattern: animationPattern)
    }
    
    func dismissDialog() {
        self.dismissDialogViewController(LSAnimationPattern.fadeInOut)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

