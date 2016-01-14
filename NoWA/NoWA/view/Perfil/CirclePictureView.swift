//
//  CirclePictureView.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 13/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class CirclePictureView: UIView {

    var picture : UIImageView?
    var borderImage : UIImageView?

    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = .clearColor()
        
        borderImage = UIImageView(image: UIImage(named: "profile_photo_container"))
        self.addSubview(borderImage!)
        
        picture = UIImageView()
        picture?.backgroundColor = .yellowColor()
        self.addSubview(picture!)
        
        self.autoSetDimension(.Width, toSize: 120)
        self.autoSetDimension(.Height, toSize: 120)
        self.layer.cornerRadius = 60
        
        picture!.autoSetDimension(.Width, toSize: 100)
        picture!.autoSetDimension(.Height, toSize: 100)
        picture!.layer.cornerRadius = 50
        
        borderImage?.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        borderImage?.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        borderImage?.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        borderImage?.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        
        picture?.autoCenterInSuperview()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }

}
