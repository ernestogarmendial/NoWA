//
//  ConfigTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 14/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ConfigTableViewCell: GenericTableViewCell {
    
    var configLabel : UILabel?
    
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
        
        configLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: self, withOffset: 20)
        configLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        configLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        configLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
}
