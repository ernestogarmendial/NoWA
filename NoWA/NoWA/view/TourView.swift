//
//  TourView.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 11/30/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TourView: UIView {
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        //        self.imageView = UIImageView()
        //        imageView.backgroundColor = UIColor.clearColor()
        //        imageView.userInteractionEnabled = true
        //        self.addSubview(imageView)
        //
        //        self.bringSubviewToFront(imageView)

    }
    
    func setBackground(){
        if self.tag == 100{
            self.backgroundColor = .greenColor()
        }else if self.tag == 101{
            self.backgroundColor = .grayColor()
        }else if self.tag == 102{
            self.backgroundColor = .orangeColor()
            
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    
}
