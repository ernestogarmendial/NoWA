//
//  TorneoCancelAllTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 25/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TorneoCancelAllTableViewCell: GenericTableViewCell {
    
    var configLabel : UILabel?
    var cancelButton : UIButton?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .ribbonAltColor()
        self.contentView.backgroundColor = .ribbonAltColor()
        
        configLabel = UILabel()
        configLabel?.backgroundColor = .clearColor()
        configLabel!.text = "Configuración"
        configLabel!.textColor = .whiteColor()
        configLabel!.font = UIFont.appLatoFontOfSize(14)
        configLabel!.adjustsFontSizeToFitWidth = true
        configLabel!.textAlignment = .Left
        configLabel!.numberOfLines = 1
        self.addSubview(configLabel!)
        
        cancelButton = UIButton()
        cancelButton!.backgroundColor = .clearColor()
        cancelButton!.setTitle("CANCELAR TODO", forState: UIControlState.Normal)
        cancelButton!.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        cancelButton!.titleLabel!.font = UIFont.appLatoFontOfSize(12)
        cancelButton!.addTarget(self, action: "cancelAll", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(cancelButton!)
        
        configLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: self, withOffset: 20)
//        configLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        configLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        configLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        
        cancelButton!.autoPinEdge(.Right, toEdge: .Right, ofView: self, withOffset: -15)
//        cancelButton!.autoPinEdge(.Left, toEdge: .Right, ofView: configLabel!)
        cancelButton!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        cancelButton!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    func cancelAll(){
        print("cancel")
    }
    
}
