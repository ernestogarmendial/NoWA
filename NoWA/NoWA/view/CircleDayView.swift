//
//  CircleDayView.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 21/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class CircleDayView: UIView {

    var day : String!
    var textLabel: UILabel?
    
    init(day: String, frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = .blueColor()
        
        textLabel = UILabel()
        textLabel!.textColor = .whiteColor()
        textLabel!.text = day
        textLabel!.font = UIFont.appLatoFontOfSize(8)
        textLabel!.adjustsFontSizeToFitWidth = true
        textLabel!.textAlignment = .Center
        textLabel!.numberOfLines = 1
        self.addSubview(textLabel!)
        
        self.autoSetDimension(.Width, toSize: 20)
        self.autoSetDimension(.Height, toSize: 20)
        self.layer.cornerRadius = 10
        
        textLabel!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        textLabel!.autoAlignAxis(.Vertical, toSameAxisOfView: self)
     
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }

}
