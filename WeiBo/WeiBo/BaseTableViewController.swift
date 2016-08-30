//
//  BaseTableViewController.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/30.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    /// 用户登录状态
    var isLogin = false
    
    /// 访客视图
    var visitorView: VisitorView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    // MARK: - 内部控制方法
    private func setupVisitorView() {
        visitorView = VisitorView.visitorView()
        view = visitorView
        
        visitorView?.loginButton.addTarget(self, action: #selector(BaseTableViewController.loginBtnClick(_:)), forControlEvents: .TouchUpInside)
        visitorView?.registerButton.addTarget(self, action: #selector(BaseTableViewController.reigsterBtnClick(_:)), forControlEvents: .TouchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(loginBtnClick(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", style: .Plain, target: self, action: #selector(reigsterBtnClick(_:)))
    }
    
    /// 监听登录按钮
    @objc private func loginBtnClick(btn: UIButton) {
        HIELog("loginBtnClick")
    }
    
    /// 监听注册按钮
    @objc private func reigsterBtnClick(btn: UIButton) {
        HIELog("reigsterBtnClick")
    }
}
