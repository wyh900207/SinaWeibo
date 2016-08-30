//
//  MainViewController.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/30.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    // MARK: - 生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 添加中间的加号按钮
        tabBar.addSubview(composeBtn)
        
        // 设置加号的位置
        let rect = composeBtn.frame
        let width = tabBar.bounds.width / CGFloat(childViewControllers.count)
        composeBtn.frame = CGRect(x: 2 * width, y: 0, width: width, height: rect.height)
    }
    
    // MARK: - 内部控制方法
    @objc private func composeBtnClick(btn: UIButton) {
        HIELog(btn)
    }
    
    // MARK: - 懒加载
    private lazy var composeBtn: UIButton = {
        let btn = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
        btn.addTarget(self, action: #selector(composeBtnClick), forControlEvents: .TouchUpInside)
        
        return btn
    }()
}
