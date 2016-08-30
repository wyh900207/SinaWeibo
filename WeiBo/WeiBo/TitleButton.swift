//
//  TitleButton.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/30.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Selected)
        
        setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        sizeToFit()
    }
    
    override func setTitle(title: String?, forState state: UIControlState) {
        // ?? 用于判断前面的参数是否为nil,如果为nil,就返回??后边的数据,如果不是nil,那么??后面的语句不执行
        super.setTitle((title ?? "") + "  ", forState: state)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /*
        // offsetInPlace用来设置 控件 的偏移位置
        titleLabel?.frame.offsetInPlace(dx: -imageView!.frame.width * 0.5, dy: 0)
        imageView?.frame.offsetInPlace(dx: titleLabel!.frame.width * 0.5, dy: 0)
         */
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.width
    }
}
