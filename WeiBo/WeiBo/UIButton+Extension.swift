//
//  UIButton+Extension.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/29.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

extension UIButton {
    /// 根据2张图片来创建一个按钮
    convenience init(imageName: String, bgImageName: String) {
        self.init()
        
        setBackgroundImage(UIImage(named: bgImageName), forState: .Normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highLight"), forState: .Highlighted)
        setImage(UIImage(named: imageName), forState: .Normal)
        setImage(UIImage(named: imageName + "_highLight"), forState: .Highlighted)
        sizeToFit()
    }
}
