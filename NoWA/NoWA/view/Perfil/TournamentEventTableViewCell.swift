//
//  TournamentEventTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 26/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TournamentEventTableViewCell: GenericTableViewCell {
    
    var eventName : UILabel?
    var stampLabel : UILabel?
    var cancelIcon: UIImageView?
    var isCancel : Bool?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clearColor()
        self.contentView.backgroundColor = .clearColor()
        
        self.isCancel = true
        
        cancelIcon = UIImageView()
        cancelIcon!.image = UIImage(named: "tilde")
        cancelIcon!.contentMode = UIViewContentMode.ScaleAspectFit
        self.addSubview(cancelIcon!)
        
        eventName = UILabel()
        eventName?.backgroundColor = .clearColor()
        eventName!.textColor = .whiteColor()
        eventName!.font = UIFont.appLatoFontOfSize(14)
        eventName!.adjustsFontSizeToFitWidth = true
        eventName!.textAlignment = .Left
        eventName!.numberOfLines = 1
        self.addSubview(eventName!)
        
        stampLabel = UILabel()
        stampLabel?.backgroundColor = .clearColor()
        stampLabel!.text = "25-12-2015 10:15 am - Sede Pilar"
        stampLabel!.textColor = .whiteColor()
        stampLabel!.font = UIFont.appLatoFontOfSize(14)
        stampLabel!.adjustsFontSizeToFitWidth = true
        stampLabel!.textAlignment = .Left
        stampLabel!.numberOfLines = 1
        self.addSubview(stampLabel!)
        
        cancelIcon!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        cancelIcon!.autoPinEdge(.Left, toEdge: .Left, ofView: self, withOffset: 20)
        cancelIcon!.autoSetDimension(.Height, toSize: 20)
        cancelIcon!.autoSetDimension(.Width, toSize: 20)
        
        eventName!.autoPinEdge(.Left, toEdge: .Right, ofView: cancelIcon!, withOffset: 20)
        eventName!.autoPinEdge(.Right, toEdge: .Right, ofView: self, withOffset:20)
        eventName!.autoPinEdge(.Top, toEdge: .Top, ofView: self, withOffset: 10)
        
        stampLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: eventName!)
        stampLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: eventName!)
        stampLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: eventName!)
        stampLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self, withOffset: -10)
        stampLabel!.autoMatchDimension(.Height, toDimension: .Height, ofView: eventName!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkCancel(){
        if cancelIcon?.hidden == true {
            cancelIcon?.hidden = false
            self.isCancel = true
        }else{
            cancelIcon?.hidden = true
            self.isCancel = false
        }
    }
    
    func setValues(event : TournamentDTO){
        
        self.eventName?.text = ""
        self.stampLabel?.text = ""
        
        var teamsString : String!
        
        for team in event.teams!{
            
            let _team = team as! TeamDTO
            teamsString = _team.name!
            
            if eventName!.text == "" {
                eventName!.text = teamsString
            }else{
                eventName!.text = eventName!.text! + " VS \(teamsString)"
            }
            
        }
        
        if let stamp = event.stamp {

            let formatedStamp = stamp as NSString
            let day = formatedStamp.substringWithRange(NSRange(location: 8, length: 2))
            let month = formatedStamp.substringWithRange(NSRange(location: 5, length: 2))
            let year = formatedStamp.substringWithRange(NSRange(location: 0, length: 4))
            let hourmin = formatedStamp.substringWithRange(NSRange(location: 11, length: 5))
            
            self.stampLabel?.text = "\(day)-\(month)-\(year) \(hourmin)"
            
        }
        
        if let zone = event.eventZone {
            self.stampLabel!.text = self.stampLabel!.text! + " - \(zone)"
        }
        
  
        
        
    }
    
}

