//
//  UIBarButtonItem+Extension.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/30.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName: String, target: AnyObject?, action: Selector) {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        self.init(customView: btn)
    }
}
