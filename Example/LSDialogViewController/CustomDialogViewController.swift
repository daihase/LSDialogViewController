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
    }

    // close dialogView.
    @IBAction func closeButton(_ sender: AnyObject) {
        self.delegate?.dismissDialog()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
