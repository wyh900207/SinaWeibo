//
//  HIEPresentationManager.swift
//  WeiBo
//
//  Created by HomerIce on 16/8/30.
//  Copyright © 2016年 HomerIce. All rights reserved.
//

import UIKit

/// 自定义转场 展现
let HIEPresentationManagerDidPresented = "HIEPresentationManagerDidPresented"
/// 自定义转场 消失
let HIEPresentationManagerDidDismissed = "HIEPresentationManagerDidDismissed"

class HIEPresentationManager: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    /// 标记当前是否展示
    private var isPresent = false
    
    // 返回一个负责转场动画的对象
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return HIEPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        NSNotificationCenter.defaultCenter().postNotificationName(HIEPresentationManagerDidPresented, object: self)
        
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        NSNotificationCenter.defaultCenter().postNotificationName(HIEPresentationManagerDidDismissed, object: self)
        
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            willPresentedController(transitionContext)
        } else {
            willDismissedController(transitionContext)
        }
    }
    
}

// MARK: - 展示 和 消失 动画
extension HIEPresentationManager {
    /// 展现动画
    private func willPresentedController(transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.viewForKey(UITransitionContextToViewKey) else {
            return
        }
        
        transitionContext.containerView()?.addSubview(toView)
        
        toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            toView.transform = CGAffineTransformIdentity
        }) { (_) -> Void in
            transitionContext.completeTransition(true)
        }
    }
    
    /// 消失动画
    private func willDismissedController(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromview = transitionContext.viewForKey(UITransitionContextFromViewKey) else {
            return
        }
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            //                fromview.transform = CGAffineTransformMakeScale(1.0, 0.00001)
            fromview.transform = CGAffineTransformIdentity
            }, completion: { (_) -> Void in
                transitionContext.completeTransition(true)
        })
    }
}
