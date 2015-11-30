//
//  UIColorExtension.swift
//  ChowFan
//
//  Created by Ernesto Garmendia on 7/2/15.
//  Copyright (c) 2015 TICTAPPS. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func twitterBlueColor()-> UIColor {
        return UIColor(red: 178.7/255, green: 24.8/255, blue: 10.4/255, alpha: 1.0)
    }
    
    class func viewPagerColor() -> UIColor {
        return UIColor(red: 23.0/255.0, green: 23.0/255.0, blue: 24.0/255.0, alpha: 1.0);
    }
    
    class func darkGreyCustomColor() -> UIColor {
        return UIColorFromRGB("1E1E20")
    }
    
    class func normalGreyCustomColor() -> UIColor {
        return UIColorFromRGB("2A2C2B")
    }
    
    
    class func UIColorFromRGB(colorCode: String, alpha: Float = 1.0) -> UIColor {
        let scanner = NSScanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}
