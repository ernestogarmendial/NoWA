//
//  SliderTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class SliderTableViewCell: GenericTableViewCell {

    var titleView : UIView?
    var sliderView : UIView?
    
    var titleLabel : UILabel?
    var leftIcon : UIImageView?
    var rightIcon : UIImageView?
    var sliderLeft : UISlider?

    var titleString : String?
    var rightIconString : String?
    var leftIconString : String?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .registroGrayColor()
        self.contentView.backgroundColor = .registroGrayColor()
        
        let path = NSBundle.mainBundle().pathForResource("ServicioTabCells", ofType: "plist")
        let cellsArray = NSMutableArray(contentsOfFile: path!)
        
        for var i = 0; i < cellsArray!.count; i++ {
            if cellsArray![i]["identifier"] as! String == reuseIdentifier {
                if let dictionary = cellsArray![i] as? NSDictionary {
                    
                    if let left_icon = dictionary["left_icon"] as? String{
                        leftIconString = left_icon
                    }
                    
                    if let right_icon = dictionary["right_icon"] as? String{
                        rightIconString = right_icon
                    }
                    
                    if let title = dictionary["title"] as? String{
                        titleString = title
                    }
                }
            }
        }
        
        leftIcon = UIImageView()
        leftIcon!.image = UIImage(named: leftIconString!)
        leftIcon!.contentMode = UIViewContentMode.Center
        self.addSubview(leftIcon!)
        
        rightIcon = UIImageView()
        rightIcon!.image = UIImage(named: leftIconString!)
        rightIcon!.contentMode = UIViewContentMode.Center
        self.addSubview(rightIcon!)
        
        titleLabel = UILabel()
        titleLabel!.text = titleString
        titleLabel!.textColor = .whiteColor()
        titleLabel!.font = UIFont.appLatoFontOfSize(14)
        titleLabel!.adjustsFontSizeToFitWidth = true
        titleLabel!.textAlignment = .Left
        titleLabel!.numberOfLines = 1
        self.addSubview(titleLabel!)
        
        sliderLeft = UISlider()
        sliderLeft!.minimumValue = 0
        sliderLeft!.maximumValue = 100
        self.addSubview(sliderLeft!)

        
        titleView = UIView()
        titleView!.addSubview(leftIcon!)
        titleView!.addSubview(titleLabel!)
        self.addSubview(titleView!)
        
        sliderView = UIView()
        sliderView!.addSubview(sliderLeft!)
        self.addSubview(sliderView!)
        
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        
        leftIcon!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        leftIcon!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        leftIcon!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        leftIcon!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        
        titleLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
//        titleLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        titleLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        titleLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        
        sliderLeft!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        sliderLeft!.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel!)
        sliderLeft!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        sliderLeft!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        sliderLeft!.autoMatchDimension(.Height, toDimension: .Height, ofView: titleLabel!)
        
        rightIcon!.autoPinEdge(.Left, toEdge: .Right, ofView: titleLabel!)
        rightIcon!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        rightIcon!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        rightIcon!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
    }
    
    func rightButtonPressed(){
        print("pepe")
    }

}
