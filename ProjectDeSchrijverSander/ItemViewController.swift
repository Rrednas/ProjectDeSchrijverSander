//
//  ItemViewController.swift
//  ProjectDeSchrijverSander
//
//  Created by sander on 10/01/16.
//  Copyright © 2016 sander. All rights reserved.
//


import UIKit


class ItemViewController: UITableViewController
{
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var QuantityLabel: UILabel!
    @IBOutlet weak var PreviewView: UIView!
    
    var item: Item!
    
    override func viewDidLoad() {
        
        title = item.name
        DescriptionLabel.text = item.description
        QuantityLabel.text = "Q: \(item.quantity)"
        item.AnimationView.backgroundColor = UIColor.redColor()
        item.AnimationView.translatesAutoresizingMaskIntoConstraints = true
        //view constraints
        item.AnimationView.center = CGPoint(x: PreviewView.bounds.midX, y: PreviewView.bounds.midY)
        item.AnimationView.autoresizingMask = [UIViewAutoresizing.FlexibleLeftMargin, UIViewAutoresizing.FlexibleRightMargin, UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleBottomMargin]
        
        PreviewView.addSubview(item.AnimationView)
        
        let options = UIViewAnimationOptions.Repeat
        let duration = NSTimeInterval(2)
        let delay = NSTimeInterval(0)
        UIView.animateWithDuration(duration,delay: delay ,options : options, animations: {
            
            self.PreviewView.subviews.first?.transform = CGAffineTransformMakeRotation((360 * CGFloat(M_PI)) / 360.0)
            
            
            }, completion: nil
                
                
                
                
                
        )

    }
    
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        if !splitViewController!.collapsed {
            navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem()
        }
    }
}