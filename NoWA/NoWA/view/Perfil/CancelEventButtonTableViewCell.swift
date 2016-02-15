//
//  CancelEventButtonTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 1/26/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

protocol CancelEventDelegate {
    func cancelButtonPressed() -> Void
}

class CancelEventButtonTableViewCell: GenericTableViewCell {
    
    var button : TTPopButton?
    var cancelDelegate : CancelEventDelegate?

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .serviceLocationColor()
        self.contentView.backgroundColor = .serviceLocationColor()
        
        button = TTPopButton()
        button!.backgroundColor = .servicePickerBlueColor()
        button!.setTitle("CANCELAR", forState: UIControlState.Normal)
        button!.titleLabel!.font = UIFont.appLatoFontOfSize(15)
        button!.addTarget(self, action: "cancel", forControlEvents: UIControlEvents.TouchUpInside)
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
    
    func cancel(){
        print("cancelar pressed")
        self.cancelDelegate!.cancelButtonPressed()
    }

}
