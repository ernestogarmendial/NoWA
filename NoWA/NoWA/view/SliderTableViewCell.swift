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
    var sliderLeftValue : UILabel?
    var sliderRight : UISlider?
    var sliderRightValue : UILabel?
    
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
        //        rightIcon!.image = UIImage(named: leftIconString!)
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
        sliderLeft!.value = 0
        sliderLeft!.tintColor = UIColor.loginBlueColor()
        sliderLeft!.minimumTrackTintColor = UIColor.loginBlueColor()
        sliderLeft!.maximumTrackTintColor = UIColor.loginBlueColor()
        sliderLeft!.continuous = true;
        sliderLeft!.addTarget(self, action: "sliderLeftValueChanged:", forControlEvents: .ValueChanged)
        self.addSubview(sliderLeft!)
        
        sliderLeftValue = UILabel()
        sliderLeftValue!.text = "0"
        sliderLeftValue!.textColor = .whiteColor()
        sliderLeftValue!.font = UIFont.appLatoFontOfSize(14)
        sliderLeftValue!.adjustsFontSizeToFitWidth = true
        sliderLeftValue!.textAlignment = .Center
        sliderLeftValue!.numberOfLines = 1
        self.addSubview(sliderLeftValue!)
        
        sliderRight = UISlider()
        sliderRight!.minimumValue = 0
        sliderRight!.maximumValue = 100
        sliderRight!.value = 100
        sliderRight!.minimumTrackTintColor = UIColor.loginBlueColor()
        sliderRight!.maximumTrackTintColor = UIColor.loginBlueColor()
        sliderRight!.continuous = true;
        sliderRight!.addTarget(self, action: "sliderRightValueChanged:", forControlEvents: .ValueChanged)
        self.addSubview(sliderRight!)
        
        sliderRightValue = UILabel()
        sliderRightValue!.text = "100"
        sliderRightValue!.textColor = .whiteColor()
        sliderRightValue!.font = UIFont.appLatoFontOfSize(14)
        sliderRightValue!.adjustsFontSizeToFitWidth = true
        sliderRightValue!.textAlignment = .Center
        sliderRightValue!.numberOfLines = 1
        self.addSubview(sliderRightValue!)
        
        titleView = UIView()
        titleView!.addSubview(leftIcon!)
        titleView!.addSubview(titleLabel!)
        self.addSubview(titleView!)
        
        
        sliderView = UIView()
        sliderView!.addSubview(sliderLeft!)
        sliderView!.addSubview(sliderRight!)
        self.addSubview(sliderView!)
        
        setupConstrains()
    }
    
    
    func sliderLeftValueChanged(sender: UISlider) {
        
        if sender.value >= sliderRight?.value{
            sender.value = (sliderRight?.value)!
        }else{
            let value : Int = Int(sender.value)
            sliderLeftValue!.text = String(value)
        }
    }
    
    
    func sliderRightValueChanged(sender: UISlider) {
        
        if sender.value <= sliderLeft?.value{
            sender.value = (sliderLeft?.value)!
        }else{
            let value : Int = Int(sender.value)
            sliderRightValue!.text = String(value)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        
        titleView!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        titleView!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        titleView!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        titleView!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.5)
        
        
        leftIcon!.autoPinEdge(.Left, toEdge: .Left, ofView: titleView!)
        leftIcon!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: titleView!)
        
        leftIcon!.autoPinEdge(.Top, toEdge: .Top, ofView: titleView!)
        leftIcon!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        
        titleLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        titleLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: titleView!)
        titleLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: titleView!)
        titleLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: titleView!)
        
        sliderView!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        sliderView!.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel!)
        sliderView!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        sliderView!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        sliderView!.autoMatchDimension(.Height, toDimension: .Height, ofView: titleLabel!)
        
        sliderLeft!.autoPinEdge(.Left, toEdge: .Left, ofView: sliderView!)
        //        sliderLeft!.autoPinEdge(.Right, toEdge: .Right, ofView: sliderView!)
        sliderLeft!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: sliderView!)
        sliderLeft!.autoPinEdge(.Top, toEdge: .Top, ofView: sliderView!)
        
        sliderRight!.autoPinEdge(.Left, toEdge: .Right, ofView: sliderLeft!, withOffset: 12)
        sliderRight!.autoPinEdge(.Right, toEdge: .Right, ofView: sliderView!)
        sliderRight!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: sliderView!)
        sliderRight!.autoPinEdge(.Top, toEdge: .Top, ofView: sliderView!)
        sliderRight!.autoMatchDimension(.Width, toDimension: .Width, ofView: sliderLeft!, withMultiplier: 1)
        
        rightIcon!.autoPinEdge(.Left, toEdge: .Right, ofView: titleLabel!)
        rightIcon!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        rightIcon!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        rightIcon!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        
        sliderLeftValue!.autoPinEdge(.Left, toEdge: .Left, ofView: leftIcon!)
        sliderLeftValue!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        sliderLeftValue!.autoPinEdge(.Top, toEdge: .Bottom, ofView: leftIcon!)
        
        sliderRightValue!.autoPinEdge(.Left, toEdge: .Right, ofView: sliderView!)
        sliderRightValue!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        sliderRightValue!.autoPinEdge(.Top, toEdge: .Bottom, ofView: leftIcon!)
        
    }
    
    func rightButtonPressed(){
        print("pepe")
    }
    
}
