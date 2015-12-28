//
//  ButtonTableFooterView.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ButtonTableFooterView: GenericTableViewCell{//UIView {
    
    var acceptButton : UIButton?
    
    //    override init(frame: CGRect) {
    //        super.init(frame:frame)
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .registroGrayColor()
        self.contentView.backgroundColor = .registroGrayColor()
        
        acceptButton = UIButton()
        acceptButton!.backgroundColor = .servicePickerBlueColor()
        acceptButton!.setTitle("ACEPTAR", forState: UIControlState.Normal)
        acceptButton!.titleLabel!.font = UIFont.appLatoFontOfSize(15)
        acceptButton!.addTarget(self, action: "accept", forControlEvents: UIControlEvents.TouchUpInside)
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
        
    }
    
    func accept(){
        print("aceptar pressed")
    }
    
}
