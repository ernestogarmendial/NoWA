//
//  UIColorExtension.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func tourBlueColor()-> UIColor {
        return UIColor(red: 0/255, green: 159/255, blue: 232/255, alpha: 1.0)
    }
    
    class func loginRedColor()-> UIColor {
        return UIColor(red: 252/255, green: 54/255, blue: 175/255, alpha: 1.0)
    }
    
    class func loginBlueColor()-> UIColor {
        return UIColor(red: 50/255, green: 142/255, blue: 255/255, alpha: 1.0)
    }
    
    class func buttonSelectedRedColor()-> UIColor {
        return UIColor(red: 255/255, green: 62/255, blue: 117/255, alpha: 1.0)
    }
    
    class func registroGrayColor()-> UIColor {
        return UIColor(red: 58/255, green: 70/255, blue: 86/255, alpha: 1.0)
    }
    
    class func darkGrayCustomColor() -> UIColor {
        return UIColor(red: 36/255, green: 39/255, blue: 43/255, alpha: 1.0)
    }
    
    class func ribbonAltColor() -> UIColor {
        return UIColorFromRGB("566b85")
    }
    
    class func serviceLocationColor()-> UIColor {
        return UIColor(red: 58/255, green: 70/255, blue: 86/255, alpha: 0.5)
    }
    
    class func servicePickerBlueColor() -> UIColor{
        return UIColorFromRGB("2b90bb").colorWithAlphaComponent(0.5)//("1d8eaa")
    }
    
    class func daysInactiveColor() -> UIColor{
        return UIColorFromRGB("909294")
    }
    
    class func daysActiveColor() -> UIColor{
        return UIColorFromRGB("00b8ff")
    }
    
    class func canceledGrayColor() -> UIColor {
        return UIColor(red: 144/255, green: 146/255, blue: 148/255, alpha: 1.0)
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
