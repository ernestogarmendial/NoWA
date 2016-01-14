//
//  ButtonTableFooterView.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

protocol ButtonFooterDelegate {
    func acceptButtonPressed() -> Void
}

class ButtonTableFooterView: GenericTableViewCell{//UIView {
    
    //    var delegate : ButtonFooterDelegate?
    var acceptButton : UIButton?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .registroGrayColor()
        self.contentView.backgroundColor = .registroGrayColor()
        
        acceptButton = UIButton()
        //        acceptButton!.backgroundColor = .servicePickerBlueColor()
        //        acceptButton!.setTitle("ACEPTAR", forState: UIControlState.Normal)
        acceptButton!.titleLabel!.font = UIFont.appLatoFontOfSize(15)
//                acceptButton!.addTarget(self, action: "accept", forControlEvents: UIControlEvents.TouchUpInside)
        acceptButton!.layer.cornerRadius = 20
        self.addSubview(acceptButton!)
        
        acceptButton!.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self)
        acceptButton!.autoAlignAxis(ALAxis.Horizontal, toSameAxisOfView: self)
        acceptButton!.autoSetDimension(ALDimension.Height, toSize: 40)
        acceptButton!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.7)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func setItems(myDictionary: NSDictionary){
        if let title = myDictionary["title"] as? String{
            acceptButton!.setTitle(title, forState: UIControlState.Normal)
        }
        if let color = myDictionary["color"] as? String{
            acceptButton!.backgroundColor = UIColor.UIColorFromRGB("\(color)")
        }
        if let action = myDictionary["action"] as? Selector{
            acceptButton!.addTarget(self, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    func accept(){
        print("aceptar pressed")
        self.acceptDelegate!.acceptButtonPressed()
    }
    
}
