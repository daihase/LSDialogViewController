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
        showDialog(.fadeInOut)
    }
    
    @IBAction func tapButtonZoomInZoomOut(_ sender: AnyObject) {
        showDialog(.zoomInOut)
    }
    
    @IBAction func tapButtonSlideBottomBottom(_ sender: AnyObject) {
        showDialog(.slideBottomBottom)
    }
    
    @IBAction func tapButtonSlideBottomTop(_ sender: AnyObject) {
        showDialog(.slideBottomTop)
    }
    
    @IBAction func tapButtonSlideLeftLeft(_ sender: AnyObject) {
        showDialog(.slideLeftLeft)
    }
    
    @IBAction func tapButtonSlideLeftRight(_ sender: AnyObject) {
        showDialog(.slideLeftRight)
    }
    
    @IBAction func tapButtonSlideTopTop(_ sender: AnyObject) {
        showDialog(.slideTopTop)
    }
    
    @IBAction func tapButtonSlideTopBottom(_ sender: AnyObject) {
        showDialog(.slideTopBottom)
    }
    
    @IBAction func tapButtonSlideRightRight(_ sender: AnyObject) {
        showDialog(.slideRightRight)
    }
    
    @IBAction func tapButtonSlideRightLeft(_ sender: AnyObject) {
        showDialog(.slideRightLeft)
    }
    
    fileprivate func showDialog(_ animationPattern: LSAnimationPattern) {
        let dialogViewController = CustomDialogViewController(nibName: "CustomDialog", bundle: nil)
        dialogViewController.delegate = self
        
        presentDialogViewController(dialogViewController, animationPattern: animationPattern)
    }
    
    func dismissDialog() {
        dismissDialogViewController(LSAnimationPattern.fadeInOut)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
