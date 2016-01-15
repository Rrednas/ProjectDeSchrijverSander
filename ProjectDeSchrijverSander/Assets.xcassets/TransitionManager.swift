//
//  TransitionManager.swift
//  ProjectDeSchrijverSander
//
//  Created by sander on 10/01/16.
//  Copyright © 2016 sander. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate  {
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        
        
        let flyThrough = CGAffineTransformMakeScale(5, 5)
        
        
       
        container!.addSubview(toView)
        container!.addSubview(fromView)
        
        
        let duration = self.transitionDuration(transitionContext)
        
        let options = UIViewAnimationOptions()
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: options, animations: {
            
            fromView.transform = flyThrough
            //fromView.transform = offScreenLeft
            toView.transform = CGAffineTransformIdentity
            
            }, completion: { finished in
                
                
                transitionContext.completeTransition(true)
                
        })
        
    }

    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
}