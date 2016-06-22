//
//  SwapAnimator.swift
//  TabControl
//
//  Created by Milan Kamilya on 21/06/16.
//  Copyright © 2016 innofied. All rights reserved.
//

import UIKit

class SwapAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    let animationDuration = 1.0
    weak var storedContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return animationDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        storedContext = transitionContext
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        
        transitionContext.containerView()?.addSubview(toView!)
        
        let animation = CABasicAnimation(keyPath: "transform")
        
        animation.fromValue = NSValue(CATransform3D: CATransform3DIdentity)
        animation.toValue = NSValue(CATransform3D:
            CATransform3DConcat(
                CATransform3DMakeTranslation(0.0, -10.0, 0.0),
                CATransform3DMakeScale(150.0, 150.0, 1.0)
            )
        )
        
        animation.duration = animationDuration
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        fromView?.layer.addAnimation(animation, forKey: nil)
        
        let fadeIn = CABasicAnimation(keyPath: "opacity")
        fadeIn.fromValue = 0.0
        fadeIn.toValue = 1.0
        fadeIn.duration = animationDuration
        toView!.layer.addAnimation(fadeIn, forKey: nil)

        
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        if let context = storedContext {
            context.completeTransition(!context.transitionWasCancelled())
            
            let fromView = context.viewForKey(UITransitionContextFromViewKey)
            fromView?.layer.removeAllAnimations()
        }
        
        storedContext = nil
    }
    
}
