//
//  CircleDayButtonsView.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 17/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class CircleDayButtonView: UIView {
    
    var day : String!
    var dayButton: UIButton?
    var isActive : Bool?
    
    init(day: String, frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = .daysActiveColor()
        
        dayButton = UIButton()
        dayButton?.setTitle(day, forState: .Normal)
        dayButton!.addTarget(self, action: #selector(CircleDayButtonView.dayPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(dayButton!)
        
        self.autoSetDimension(.Width, toSize: 30)
        self.autoSetDimension(.Height, toSize: 30)
        self.layer.cornerRadius = 15
        
        dayButton!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        dayButton!.autoAlignAxis(.Vertical, toSameAxisOfView: self)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    func dayPressed(sender: UIButton){
        sender.selected = !sender.selected;
        
        if sender.selected{
            self.backgroundColor = .daysInactiveColor()
            self.isActive = false
        }else{
            self.backgroundColor = .daysActiveColor()
            self.isActive = true
        }
    }
    
}
