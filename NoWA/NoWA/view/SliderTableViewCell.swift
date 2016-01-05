//
//  SliderTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class SliderTableViewCell: GenericTableViewCell {
    
    var minValue : NSNumber?
    var maxValue : NSNumber?
    
    var titleView : UIView?
    var sliderView : UIView?
    
    var titleLabel : UILabel?
    var leftIcon : UIImageView?
    var rightIcon : UIImageView?
    var sliderLeft : UISlider?
    var sliderMinLabel : UILabel?
    var sliderRight : UISlider?
    var sliderMaxLabel : UILabel?
    
    var rightIconString : String?
    var leftIconString : String?
    
    var unity : String!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .registroGrayColor()
        self.contentView.backgroundColor = .registroGrayColor()
        
        leftIcon = UIImageView()
        leftIcon!.contentMode = UIViewContentMode.Center
        self.addSubview(leftIcon!)
        
        rightIcon = UIImageView()
        rightIcon!.contentMode = UIViewContentMode.Center
        self.addSubview(rightIcon!)
        
        titleLabel = UILabel()
        titleLabel!.textColor = .whiteColor()
        titleLabel!.font = UIFont.appLatoFontOfSize(14)
        titleLabel!.adjustsFontSizeToFitWidth = true
        titleLabel!.textAlignment = .Left
        titleLabel!.numberOfLines = 1
        self.addSubview(titleLabel!)
        
        sliderLeft = UISlider()
        sliderLeft!.tintColor = UIColor.loginBlueColor()
        sliderLeft!.minimumTrackTintColor = UIColor.loginBlueColor()
        sliderLeft!.maximumTrackTintColor = UIColor.loginBlueColor()
        sliderLeft!.continuous = true;
        sliderLeft!.addTarget(self, action: "sliderMinLabelChanged:", forControlEvents: .ValueChanged)
        self.addSubview(sliderLeft!)
        
        sliderMinLabel = UILabel()
        sliderMinLabel!.text = "Min \nOff"
        sliderMinLabel!.textColor = .whiteColor()
        sliderMinLabel!.font = UIFont.appLatoFontOfSize(12)
        sliderMinLabel!.adjustsFontSizeToFitWidth = true
        sliderMinLabel!.textAlignment = .Center
        sliderMinLabel!.numberOfLines = 2
        self.addSubview(sliderMinLabel!)
        
        sliderRight = UISlider()
        sliderRight!.minimumTrackTintColor = UIColor.loginBlueColor()
        sliderRight!.maximumTrackTintColor = UIColor.loginBlueColor()
        sliderRight!.continuous = true;
        sliderRight!.addTarget(self, action: "sliderMaxLabelChanged:", forControlEvents: .ValueChanged)
        self.addSubview(sliderRight!)
        
        sliderMaxLabel = UILabel()
        sliderMaxLabel!.text =  "Max \nOff"
        sliderMaxLabel!.textColor = .whiteColor()
        sliderMaxLabel!.font = UIFont.appLatoFontOfSize(12)
        sliderMaxLabel!.adjustsFontSizeToFitWidth = true
        sliderMaxLabel!.textAlignment = .Center
        sliderMaxLabel!.numberOfLines = 2
        self.addSubview(sliderMaxLabel!)
        
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
    
    
    override func setItems(myDictionary: NSDictionary){
        if let left_icon = myDictionary["left_icon"] as? String{
            leftIcon!.image = UIImage(named: left_icon)
            
        }
        
        if let right_icon = myDictionary["right_icon"] as? String{
            rightIconString = right_icon
        }
        
        if let title = myDictionary["title"] as? String{
            titleLabel!.text = title
        }
        
        if let cellUnity = myDictionary["unity"] as? String{
            unity = cellUnity
        }
        
        if let minValue = myDictionary["min"] as? Float{
            sliderLeft!.minimumValue = minValue
            sliderRight!.minimumValue = minValue
            sliderLeft!.value = minValue
        }
        
        if let maxValue = myDictionary["max"] as? Float{
            sliderLeft!.maximumValue = maxValue
            sliderRight!.maximumValue = maxValue
            sliderRight!.value = maxValue
            
        }
        
    }
    
    func sliderMinLabelChanged(sender: UISlider) {
        
        var value : Int!
        
        if sender.value >= sliderRight?.value{
            sender.value = (sliderRight?.value)!
            value = Int((sliderRight?.value)!)
        }else{
            value = Int(sender.value)
        }
        
        if value != Int((sliderLeft?.minimumValue)!) {
            sliderMinLabel!.text = "Min \n \(String(value))\(unity)"
        }else{
            sliderMinLabel!.text = "Min \nOff"
        }
        
        minValue = value
        
    }
    
    
    func sliderMaxLabelChanged(sender: UISlider) {
        
        var value : Int!
        
        if sender.value <= sliderLeft?.value{
            sender.value = (sliderLeft?.value)!
            value = Int((sliderLeft?.value)!)
        }else{
            value = Int(sender.value)
        }
        
        if value != Int((sliderRight?.maximumValue)!) {
            sliderMaxLabel!.text = "Max \n \(String(value))\(unity)"
        }else{
            sliderMaxLabel!.text = "Max \nOff"
        }
        
        maxValue = value

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        
        titleView!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        titleView!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        titleView!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        titleView!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.45)
        
        
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
        
        sliderMinLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: leftIcon!)
        sliderMinLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        sliderMinLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: leftIcon!)
        sliderMinLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        
        
        sliderMaxLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: sliderView!)
        sliderMaxLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        sliderMaxLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: leftIcon!)
        sliderMaxLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        
        
    }
    
    func rightButtonPressed(){
        print("pepe")
    }
    
}
