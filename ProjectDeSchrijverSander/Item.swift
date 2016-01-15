//
//  Item.swift
//  ProjectDeSchrijverSander
//
//  Created by sander on 10/01/16.
//  Copyright © 2016 sander. All rights reserved.
//

import Foundation
import UIKit
class Item {
    let name: String
    let quantity: Double
    let description: String
    let AnimationView: UIView
    init( name : String , quantity : Double , description : String, view:UIView) {
        self.description = description
        self.name = name
        self.quantity = quantity
        self.AnimationView = view
        
    }

}