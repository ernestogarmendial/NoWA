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
        cancelLabel!.font = UIFont.appLatoFontOfSize(12)
        cancelLabel!.adjustsFontSizeToFitWidth = true
        cancelLabel!.textAlignment = .Left
        cancelLabel!.numberOfLines = 2
        cancelLabel!.hidden = true
        self.addSubview(cancelLabel!)
        
        cancelLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: infoView!)
        cancelLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: self, withOffset: -12)
        cancelLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: dateLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTournament(tournament: TournamentDTO){
        
        let stamp = tournament.stamp! as NSString
        timeLabel!.text = stamp.substringWithRange(NSRange(location: 11, length: 5))
        let day = stamp.substringWithRange(NSRange(location: 8, length: 2))
        let month = stamp.substringWithRange(NSRange(location: 5, length: 2))
        dateLabel!.text = "\(day)-\(month)"
        
        var teamsString : String!
        for team in tournament.teams!{
            
            let _team = team as! TeamDTO
            teamsString = _team.name!
            
            if descriptionLabel!.text == nil {
                descriptionLabel!.text = teamsString
            }else{
                descriptionLabel!.text = descriptionLabel!.text! + " VS \(teamsString)"
            }
            
            if serviceLabel!.text == nil {
                if let tournamentName = _team.tournament {
                    serviceLabel!.text = tournamentName
                }
            }
        }
        
        if tournament.status == 0{
            cancelLabel!.hidden = false
            setInactiveColours()
        }else{
            cancelLabel!.hidden = true
        }
        
        if let daysString : String = tournament.repetition{
            let daysArray : NSArray = daysString.componentsSeparatedByString(",")
            if tournament.status == 0{
                weekDaysView?.showDays(daysArray, color: UIColor.daysInactiveColor())
            }else{
                weekDaysView?.showDays(daysArray, color: UIColor.daysActiveColor())
            }
        }
    }
    
    override func setInactiveColours(){
        super.setInactiveColours()
        serviceIcon!.image = UIImage(named: "cup_inactive")
    }
    
}
