//
//  UIFontExtension.swift
//  Encuestas
//
//  Created by Mariano D'Agostino on 5/4/15.
//  Copyright (c) 2015 WOP. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func appFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont.systemFontOfSize(fontSize);
    }
    
    class func appBlackFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Raleway-Black", size: fontSize)!;
    }
    
    class func appBlackItalicFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Raleway-BlackItalic", size: fontSize)!;
    }
    
    class func appBoldFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Raleway-Bold", size: fontSize)!;
    }
    
    class func appBoldItalicFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Raleway-BoldItalic", size: fontSize)!;
    }

}
