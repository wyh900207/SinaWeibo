//
//  VisitorView.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/30.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    
    /// 注册
    @IBOutlet weak var registerButton: UIButton!
    /// 登录
    @IBOutlet weak var loginButton: UIButton!
    /// 转盘
    @IBOutlet weak var rotationImageView: UIImageView!
    /// 图标
    @IBOutlet weak var iconImageView: UIImageView!
    /// 文本
    @IBOutlet weak var titleLabel: UILabel!

    class func visitorView() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }
    
    func setupVisitorInfo(imageName: String?, title: String) {
        titleLabel.text = title
        guard let name = imageName else {
            starAnimation()
            return
        }
        
        rotationImageView.hidden = true
        iconImageView.image = UIImage(named: name)
    }
    private func starAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = 2 * M_PI
        animation.duration = 5.0
        animation.repeatCount = MAXFLOAT
        
        // 默认情况下只要视图消失,系统就会移除动画
        animation.removedOnCompletion = false
        
        rotationImageView.layer.addAnimation(animation, forKey: nil)
    }
    
}
