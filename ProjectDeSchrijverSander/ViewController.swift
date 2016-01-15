//
//  ViewController.swift
//  ProjectDeSchrijverSander
//
//  Created by sander on 19/12/15.
//  Copyright © 2015 sander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
    let transitionManager = TransitionManager()
    var stop:Bool = false
    
    override func viewDidLoad() {
        
        let screenBounds = UIScreen.mainScreen().bounds
        let maxWidth = screenBounds.width
        let maxHeight = screenBounds.height
        
        //Animation
        
       
        
        
        
        for  _ in 0...15{
            
            initAnimatedCube(maxWidth ,maxHeight: maxHeight )
        }
        super.viewDidLoad()
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        stop = true
        let toViewController = segue.destinationViewController as UIViewController
        
        
        toViewController.transitioningDelegate = self.transitionManager
        
        
    }
    func initAnimatedCube(maxWidth:CGFloat, maxHeight:CGFloat  ){
        
    
        let duration = NSTimeInterval(4000 + arc4random_uniform(1000)) / 1000
        let delay = NSTimeInterval(100 + arc4random_uniform(4900)) / 1000
        var randomSize = (CGFloat(20 + (Int(arc4random_uniform(80)))))
        let randomY = randomSize + (CGFloat(Int(arc4random_uniform((UInt32(Int(maxHeight - randomSize * 2)))))))

        let coloredSquare:UIView = UIView()
        coloredSquare.backgroundColor = UIColor.blueColor()
        coloredSquare.frame = CGRectMake((0-randomSize) , randomY, randomSize, randomSize)
        self.view.addSubview(coloredSquare)
        self.view.sendSubviewToBack(coloredSquare)
        
        let options = UIViewAnimationOptions.CurveLinear
        
        UIView.animateWithDuration(duration,delay: delay ,options : options, animations: {
            
            
            randomSize = (CGFloat(20 + (Int(arc4random_uniform(80)))))
            // animate color change and position
            coloredSquare.backgroundColor = UIColor.redColor()
            coloredSquare.frame = CGRect(x: (maxWidth+randomSize) , y: randomY , width: randomSize, height: randomSize)
            
            }, completion: {animationFinished in
                
                if(!self.stop){self.initAnimatedCube(maxWidth,maxHeight: maxHeight)
                }
                
                coloredSquare.removeFromSuperview()
                
                
            }
            
        )
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

