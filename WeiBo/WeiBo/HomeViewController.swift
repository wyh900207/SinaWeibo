//
//  HomeViewController.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/29.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {

    let animatorManager = HIEPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !isLogin {
            visitorView?.setupVisitorInfo(nil, title: "关注一些人，回这里看看有什么惊喜")
        }
        
        setupUI()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.updateTitleStatus), name: HIEPresentationManagerDidPresented, object: animatorManager)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.updateTitleStatus), name: HIEPresentationManagerDidDismissed, object: animatorManager)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: - 懒加载
    private lazy var titleButton: TitleButton = {
        let btn = TitleButton()
        btn.setTitle("朋友圈", forState: .Normal)
        btn.addTarget(self, action: #selector(HomeViewController.titleBtnClick(_:)), forControlEvents: .TouchUpInside)
        
        return btn
    }()
    
}

// MARK: - 视图相关
extension HomeViewController {
    
    /// 添加各个子视图
    private func setupUI() {
        // 创建导航按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(HomeViewController.leftBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(HomeViewController.rightBtnClick))
        
        // 添加 titleView
        
        navigationItem.titleView = titleButton
    }
    
    /// 转场动画结束,改变titleView的选中状态
    private func updateTitleViewStatus(status: Bool) {
        let button = self.navigationItem.titleView as! TitleButton
        button.selected = status
    }
}

// MARK: - 方法绑定
extension HomeViewController {

    @objc private func leftBtnClick() {
        HIELog("clicked left")
    }
    @objc private func rightBtnClick() {
        HIELog("clicked right")
    }
    @objc private func titleBtnClick(btn: TitleButton) {
        btn.selected = !btn.selected
        
        let sb = UIStoryboard(name: "Popover", bundle: nil)
        guard let menuView = sb.instantiateInitialViewController() else {
            return
        }
        menuView.transitioningDelegate = animatorManager
        menuView.modalPresentationStyle = .Custom
        presentViewController(menuView, animated: true, completion: nil)
    }
    
    @objc private func updateTitleStatus() {
        titleButton.selected = !titleButton.selected
    }
}
