//
//  ServiceLocationTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ServiceLocationTableViewCell: GenericTableViewCell {
    
    var titleLabel : UILabel?
    var descriptionLabel : UILabel?
    var leftIcon : UIImageView?
    var rightButton : UIButton?
    
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
        leftIcon!.contentMode = UIViewContentMode.ScaleAspectFit
        self.addSubview(leftIcon!)
        
        titleLabel = UILabel()
        titleLabel!.text = titleString
        titleLabel!.textColor = .whiteColor()
        titleLabel!.font = UIFont.appLatoFontOfSize(14)
        titleLabel!.adjustsFontSizeToFitWidth = true
        titleLabel!.textAlignment = .Center
        titleLabel!.numberOfLines = 1
        self.addSubview(titleLabel!)
        
        descriptionLabel = UILabel()
        descriptionLabel!.textColor = .whiteColor()
        descriptionLabel!.font = UIFont.appLatoFontOfSize(14)
        descriptionLabel!.adjustsFontSizeToFitWidth = true
        descriptionLabel!.textAlignment = .Center
        descriptionLabel!.numberOfLines = 1
        self.addSubview(descriptionLabel!)
        
        rightButton = UIButton()
        rightButton!.addTarget(self, action: "rightButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        rightButton!.setImage(UIImage(named: rightIconString!), forState: UIControlState.Normal)
        
        self.addSubview(rightButton!)
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
        titleLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        titleLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        titleLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        
        rightButton!.autoPinEdge(.Left, toEdge: .Right, ofView: titleLabel!)
        rightButton!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        rightButton!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        rightButton!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
    }
    
    func rightButtonPressed(){
        
    }
    
}
