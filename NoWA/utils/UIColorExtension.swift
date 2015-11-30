//
//  UIColorExtension.swift
//  ChowFan
//
//  Created by Mariano D'Agostino on 7/2/15.
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
    
    class func lightGreyCustomColor() -> UIColor {
        return UIColorFromRGB("374140")
    }
    
    class func darkGrayTriviaBackgroundColor() -> UIColor {
        return UIColorFromRGB("414141")
    }
    
    class func grayQuestionTriviaColor() -> UIColor {
        return UIColorFromRGB("bdbdbd")
    }
    
    class func grayTimeTriviaColor() -> UIColor {
        return UIColorFromRGB("595959")
    }
    
    class func yellowTriviaColor() -> UIColor {
        return UIColorFromRGB("f8db00")
    }
    
    class func yellowPressedColor() -> UIColor {
        return UIColorFromRGB("edd41b")
    }
    
    class func lightBlueHomeColor() -> UIColor {
        return UIColorFromRGB("23bbea")
    }
    
    class func redTriviaColor() -> UIColor {
        return UIColorFromRGB("c0006b")
    }
    
    class func blueMenuColor() -> UIColor {
        return UIColorFromRGB("15708c")
    }
    
    class func darkGrayFestMakerColor() -> UIColor {
        return UIColorFromRGB("454545")
    }
    
    class func lightGrayFestMakerColor() -> UIColor {
        return UIColorFromRGB("727272")
    }
    
    class func orangeCustomColor() -> UIColor {
        return UIColorFromRGB("DC3522")
    }
    
    class func personalBlueColor() -> UIColor {
        return UIColorFromRGB("#6bb9e7")
    }
    
    class func lightBlueCustomColor() -> UIColor {
        return UIColorFromRGB("6bb9e7")
    }
    
    class func whiteAlphaCustomColor() -> UIColor {
        return UIColor.whiteColor().colorWithAlphaComponent(0.5)
    }
    
    class func lightBluePressedCustomColor() -> UIColor {
        return UIColorFromRGB("5aa7d4")
    }
    
    class func multiColouredColor() -> UIColor {
        return UIColor(patternImage: UIImage(named: "tiempo")!)
    }
    
    class func backgroundTiempo() -> UIColor {
        return UIColorFromRGB("#414141")
    }
    
    class func UIColorFromRGB(colorCode: String, alpha: Float = 1.0) -> UIColor {
        var scanner = NSScanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}
