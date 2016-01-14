//
//  TorneoItemTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 22/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TorneoItemTableViewCell: AlarmItemTableViewCell {

    var cancelLabel: UILabel?

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        
        alarmSwitch?.hidden = true
        
        serviceIcon!.image = UIImage(named: "cup")

        
        cancelLabel = UILabel()
        cancelLabel!.text = "CANCELADA POR ORGANIZADOR"
        cancelLabel!.textColor = UIColor.buttonSelectedRedColor()
//        cancelLabel!.backgroundColor = .yellowColor()
        cancelLabel!.font = UIFont.appLatoFontOfSize(12)
        cancelLabel!.adjustsFontSizeToFitWidth = true
        cancelLabel!.textAlignment = .Left
        cancelLabel!.numberOfLines = 2
        self.addSubview(cancelLabel!)
        
        serviceLabel!.text = "SUPER COPA"
        
        cancelLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: infoView!)
        cancelLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: self, withOffset: -12)
        cancelLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: dateLabel!)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupAlarm(alarm: PersonalAlarmDTO, type: String){
        super.setupAlarm(alarm, type: type)
        
        
    }

    
}
