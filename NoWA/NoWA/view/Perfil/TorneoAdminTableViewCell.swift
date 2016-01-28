//
//  TorneoAdminTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 17/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TorneoAdminTableViewCell: GenericTableViewCell {

    var tournamentName : UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clearColor()
        self.contentView.backgroundColor = .clearColor()
        self.selectionStyle = .Default

        
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        tournamentName = UILabel()
        tournamentName?.backgroundColor = .clearColor()
        tournamentName!.textColor = .whiteColor()
        tournamentName!.font = UIFont.appLatoFontOfSize(14)
        tournamentName!.adjustsFontSizeToFitWidth = true
        tournamentName!.textAlignment = .Left
        tournamentName!.numberOfLines = 1
        self.addSubview(tournamentName!)
        
        tournamentName!.autoPinEdge(.Left, toEdge: .Left, ofView: self, withOffset: 20)
        tournamentName!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        tournamentName!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        tournamentName!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
}
