//
//  TestViewController.swift
//  LSDialogViewController
//
//  Created by Daisuke Hasegawa on 2016/05/17.
//  Copyright © 2016年 Libra Studio, Inc. All rights reserved.
//

import UIKit

class CustomDialogViewController: UIViewController {

    var delegate: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // adjust height and width of dialog
        self.view.bounds.size.height = UIScreen.main.bounds.size.height * 0.6
        self.view.bounds.size.width = UIScreen.main.bounds.size.width * 0.8
    }

    // close dialogView
    @IBAction func closeButton(_ sender: AnyObject) {
        self.delegate?.dismissDialog()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
