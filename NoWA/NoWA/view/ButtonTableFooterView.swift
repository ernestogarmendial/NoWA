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
    func adminButtonPressed() -> Void
}

class ButtonTableFooterView: GenericTableViewCell{//UIView {
    
    //    var delegate : ButtonFooterDelegate?
    var button : UIButton?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .registroGrayColor()
        self.contentView.backgroundColor = .registroGrayColor()
        
        button = UIButton()
        //        acceptButton!.backgroundColor = .servicePickerBlueColor()
        //        acceptButton!.setTitle("ACEPTAR", forState: UIControlState.Normal)
        button!.titleLabel!.font = UIFont.appLatoFontOfSize(15)
        //                acceptButton!.addTarget(self, action: "accept", forControlEvents: UIControlEvents.TouchUpInside)
        button!.layer.cornerRadius = 20
        self.addSubview(button!)
        
        button!.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self)
        button!.autoAlignAxis(ALAxis.Horizontal, toSameAxisOfView: self)
        button!.autoSetDimension(ALDimension.Height, toSize: 40)
        button!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.7)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func setItems(myDictionary: NSDictionary){
        if let title = myDictionary["title"] as? String{
            button!.setTitle(title, forState: UIControlState.Normal)
        }
        if let color = myDictionary["color"] as? String{
            button!.backgroundColor = UIColor.UIColorFromRGB("\(color)")
        }
        if let action = myDictionary["action"] as? String{
            
            if action == "accept"{
                button!.addTarget(self, action: "accept", forControlEvents: UIControlEvents.TouchUpInside)
            }
            if action == "save"{
                button!.addTarget(self, action: "save", forControlEvents: UIControlEvents.TouchUpInside)
            }
            if action == "close"{
                button!.addTarget(self, action: "close", forControlEvents: UIControlEvents.TouchUpInside)
            }
            if action == "admin"{
                button!.addTarget(self, action: "admin", forControlEvents: UIControlEvents.TouchUpInside)
            }
        }
    }
    
    func accept(){
        print("aceptar pressed")
        self.buttonDelegate!.acceptButtonPressed()
    }
    
    func save(){
        print("guardar pressed")
//                self.acceptDelegate!.acceptButtonPressed()
    }
    
    func close(){
        print("close pressed")
        //        self.acceptDelegate!.acceptButtonPressed()
    }
    func admin(){
        print("admin pressed")
        self.buttonDelegate!.adminButtonPressed()
    }
}
