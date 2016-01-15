//
//  ItemListController.swift
//  ProjectDeSchrijverSander
//
//  Created by sander on 10/01/16.
//  Copyright © 2016 sander. All rights reserved.
//

import UIKit

class ItemListViewController: UITableViewController, UISplitViewControllerDelegate
{
    
    let transitionManager = TransitionManager()
    var items: [Item] = []
    
    
    override func viewDidLoad() {
        splitViewController!.delegate = self
        //square
        let view:UIView = UIView()
        view.backgroundColor = UIColor.redColor()
        view.frame = CGRectMake(0 , 0, 50, 50)
        let square = Item(name: "square", quantity: 2.0 , description: "4 sides, kinda pointy",view: view)
        items.append(square)
        //circle
        
        let circleView:UIView = UIView()
        circleView.frame = CGRectMake(0 , 0, 50, 50)
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 25,y: 25), radius: CGFloat(50), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.redColor().CGColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        circleView.layer.addSublayer(shapeLayer)
        let circle = Item(name: "Circle", quantity: 1.6, description: "0 sides,totally not pointy", view: circleView)
        
        //triangle
        let triangleView:UIView = UIView()
        triangleView.frame = CGRectMake(0 , 0, 50, 50)
        
        
        let trianglePath = CGPathCreateMutable()
        
        CGPathMoveToPoint(trianglePath, nil, 25, 0)
        CGPathAddLineToPoint(trianglePath, nil, 0, 50)
        CGPathAddLineToPoint(trianglePath, nil, 50, 50)
        
        let shapeLayer2 = CAShapeLayer()
        

        shapeLayer2.path = trianglePath
        
        shapeLayer.fillColor = UIColor.redColor().CGColor
        
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        
        triangleView.layer.addSublayer(shapeLayer2)
        
        let triangle = Item(name: "Triangle", quantity: 1.4, description: "3 sides ,Super pointy ", view: triangleView)
        
        items.append(circle)
        items.append(triangle)
        self.tableView.reloadData()
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("reuse", forIndexPath: indexPath)
        
        
        cell.textLabel!.text = item.name
        cell.detailTextLabel?.text = "\(item.quantity) €"
        return cell
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       	 let detail = (segue.destinationViewController as! UINavigationController).topViewController as! ItemViewController
        detail.transitioningDelegate = self.transitionManager
        let selectedItem = items[tableView.indexPathForSelectedRow!.row]
       detail.item = selectedItem
        
    }
}