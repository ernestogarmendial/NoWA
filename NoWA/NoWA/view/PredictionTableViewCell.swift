//
//  PredictionTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PredictionTableViewCell: GenericTableViewCell {
    
    var prediction : NSNumber?
    
    var titleView : UIView?
    var sliderView : UIView?
    var explainLabel : UILabel?
    var titleLabel : UILabel?
    var leftIcon : UIImageView?
    var sliderLeft : UISlider?
    var sliderLabel : UILabel?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .registroGrayColor()
        self.contentView.backgroundColor = .registroGrayColor()
        
        leftIcon = UIImageView()
        leftIcon!.contentMode = UIViewContentMode.Center
        self.addSubview(leftIcon!)
        
        titleLabel = UILabel()
        titleLabel!.textColor = .whiteColor()
        titleLabel!.font = UIFont.appLatoFontOfSize(14)
        titleLabel!.adjustsFontSizeToFitWidth = true
        titleLabel!.textAlignment = .Left
        titleLabel!.numberOfLines = 1
        self.addSubview(titleLabel!)
        
        explainLabel = UILabel()
        explainLabel!.text = "La cancelación quedará sin efecto si se predice una mejoría dentro de:"
        explainLabel!.textColor = .whiteColor()
        explainLabel!.font = UIFont.appLatoFontOfSize(14)
        explainLabel!.adjustsFontSizeToFitWidth = true
        explainLabel!.textAlignment = .Left
        explainLabel!.numberOfLines = 2
        self.addSubview(explainLabel!)
        
        sliderLabel = UILabel()
        sliderLabel!.textColor = .whiteColor()
        sliderLabel!.font = UIFont.appLatoFontOfSize(12)
        sliderLabel!.adjustsFontSizeToFitWidth = true
        sliderLabel!.textAlignment = .Center
        sliderLabel!.numberOfLines = 1
        self.addSubview(sliderLabel!)
        
        sliderLeft = UISlider()
        if self.prediction != nil{
            sliderLeft!.value = self.prediction as! Float
        }
        sliderLeft!.minimumValue = 1
        sliderLeft!.maximumValue = 3
        sliderLeft!.tintColor = UIColor.loginBlueColor()
        sliderLeft!.addTarget(self, action: "sliderValueChanged:", forControlEvents: .ValueChanged)
        self.addSubview(sliderLeft!)
        
        self.prediction = sliderLeft!.minimumValue
        sliderLabel!.text = "\(Int(sliderLeft!.minimumValue))hs"
        
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
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setItems(myDictionary: NSDictionary) {
        
        if let left_icon = myDictionary["left_icon"] as? String{
            leftIcon!.image = UIImage(named: left_icon)
            
        }
        
        if let title = myDictionary["title"] as? String{
            titleLabel!.text = title
        }
    }
    
    func setupConstrains(){
        
        titleView!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        titleView!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        titleView!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        titleView!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.33)
        
        leftIcon!.autoPinEdge(.Left, toEdge: .Left, ofView: titleView!)
        leftIcon!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: titleView!)
        leftIcon!.autoPinEdge(.Top, toEdge: .Top, ofView: titleView!)
        leftIcon!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        
        titleLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        titleLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: titleView!)
        titleLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: titleView!)
        titleLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: titleView!)
        
        explainLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleView!)
        explainLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        explainLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: self, withOffset: -20)
        explainLabel!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.33)
        
        sliderView!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        sliderView!.autoPinEdge(.Top, toEdge: .Bottom, ofView: explainLabel!)
        sliderView!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        sliderView!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        
        sliderLeft!.autoPinEdge(.Left, toEdge: .Left, ofView: sliderView!)
        sliderLeft!.autoPinEdge(.Right, toEdge: .Right, ofView: sliderView!)
        sliderLeft!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: sliderView!)
        sliderLeft!.autoPinEdge(.Top, toEdge: .Top, ofView: sliderView!)
        
        sliderLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: sliderView!)
        sliderLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        sliderLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: leftIcon!)
        sliderLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        
    }
    
    func rightButtonPressed(){
        print("pepe")
    }
    
    func sliderValueChanged(sender: UISlider) {
        
        let value = Int(sender.value)
        
        self.prediction = value as NSNumber
        
//        if value != Int((sliderLeft?.minimumValue)!) {
            sliderLabel!.text = "\(String(value))hs"
//        }else{
//            sliderLabel!.text = "Off"
//        }
    }
    
    
}
