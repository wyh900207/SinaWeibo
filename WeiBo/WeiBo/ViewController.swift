//
//  ViewController.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/29.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let btn: UIButton = UIButton(imageName: "add_normal", bgImageName: "add_normal_bg")
        let btn = UIButton(type: .Custom)
        btn.setBackgroundImage(UIImage(named: "add_normal_bg"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "add_normal_bg" + "_highLight"), forState: .Highlighted)
        btn.setImage(UIImage(named: "add_normal"), forState: .Normal)
        btn.setImage(UIImage(named: "add_normal" + "_highLight"), forState: .Highlighted)
        btn.sizeToFit()
        btn.center = view.center
        
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

