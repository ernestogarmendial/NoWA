//
//  AlarmItemTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 21/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AlarmItemTableViewCell: GenericTableViewCell {

    var serviceIcon: UIImageView?
    var serviceLabel: UILabel?
    var serviceView : UIView?
    var separatorBar : UIView?
    var timeLabel: UILabel?
    var dateLabel: UILabel?
    var descriptionLabel: UILabel?
    var infoView : UIView?
    var weekDaysView : WeekDaysView?
    var alarmSwitch : UISwitch?

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .darkGrayCustomColor()
        
        serviceIcon = UIImageView()
        serviceIcon!.image = UIImage(named: "accu-weather")
        serviceIcon!.backgroundColor = .grayColor()
        serviceIcon!.contentMode = UIViewContentMode.ScaleAspectFill
        self.addSubview(serviceIcon!)
        
        serviceLabel = UILabel()
        serviceLabel!.text = "ACCU WEATHER"
        serviceLabel!.textColor = .whiteColor()
        serviceLabel!.backgroundColor = .yellowColor()
        serviceLabel!.font = UIFont.appLatoFontOfSize(12)
        serviceLabel!.adjustsFontSizeToFitWidth = true
        serviceLabel!.textAlignment = .Center
        serviceLabel!.numberOfLines = 2
        self.addSubview(serviceLabel!)
        
        serviceView = UIView()
        serviceView!.backgroundColor = .orangeColor()
        serviceView!.addSubview(serviceIcon!)
        serviceView!.addSubview(serviceLabel!)
        self.addSubview(serviceView!)
        
        separatorBar = UIView()
        separatorBar!.backgroundColor = .blueColor()
        self.addSubview(separatorBar!)
        
        timeLabel = UILabel()
        timeLabel!.text = "07:30"
        timeLabel!.textColor = .whiteColor()
        timeLabel!.backgroundColor = .yellowColor()
        timeLabel!.font = UIFont.appLatoFontOfSize(40)
        timeLabel!.adjustsFontSizeToFitWidth = true
        timeLabel!.textAlignment = .Left
        timeLabel!.numberOfLines = 1
        self.addSubview(timeLabel!)
        
        dateLabel = UILabel()
        dateLabel!.text = "27-05"
        dateLabel!.textColor = .whiteColor()
        dateLabel!.backgroundColor = .blueColor()
        dateLabel!.font = UIFont.appLatoFontOfSize(15)
        dateLabel!.adjustsFontSizeToFitWidth = true
        dateLabel!.textAlignment = .Left
        dateLabel!.numberOfLines = 1
        self.addSubview(dateLabel!)
        
        descriptionLabel = UILabel()
        descriptionLabel!.text = "ENTRENAMIENTO SEMANAL"
        descriptionLabel!.textColor = .whiteColor()
        descriptionLabel!.backgroundColor = .greenColor()
        descriptionLabel!.font = UIFont.appLatoFontOfSize(12)
        descriptionLabel!.adjustsFontSizeToFitWidth = true
        descriptionLabel!.textAlignment = .Left
        descriptionLabel!.numberOfLines = 1
        self.addSubview(descriptionLabel!)
        
        infoView = UIView()
        infoView?.backgroundColor = .purpleColor()
        infoView?.addSubview(timeLabel!)
        infoView?.addSubview(dateLabel!)
        infoView?.addSubview(descriptionLabel!)
        self.addSubview(infoView!)
        
        weekDaysView = WeekDaysView()
        weekDaysView?.backgroundColor = .redColor()
        self.addSubview(weekDaysView!)
        
        
        alarmSwitch = UISwitch()
        alarmSwitch?.setOn(true, animated: true)
        self.addSubview(alarmSwitch!)

        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstrains(){
//         serviceIcon
//         serviceLabel
//         separatorBar
//         timeLabel
//         dateLabel
//         descriptionLabel
//         weekDaysView
//         alarmSwitch
        
        serviceView!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        serviceView!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        serviceView!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        serviceView!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.2)
        
        serviceIcon!.autoAlignAxis(.Vertical, toSameAxisOfView: serviceView!)
        serviceIcon!.autoConstrainAttribute(.MarginTop, toAttribute: .MarginTop, ofView: self, withMultiplier: 2)
        serviceIcon!.autoMatchDimension(.Width, toDimension: .Width, ofView: serviceView!, withMultiplier: 0.5)
        serviceIcon!.autoMatchDimension(.Height, toDimension: .Width, ofView: serviceView!, withMultiplier: 0.5)
        
        serviceLabel!.autoAlignAxis(.Vertical, toSameAxisOfView: serviceView!)
        serviceLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: serviceView!, withOffset: 5)
        serviceLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: serviceView!, withOffset: -5)
        serviceLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: serviceIcon!, withOffset: 5)
        serviceLabel!.autoMatchDimension(.Height, toDimension: .Width, ofView: serviceView!, withMultiplier: 0.5)
    
        separatorBar!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.8)
        separatorBar!.autoSetDimension(.Width, toSize: 1.5)
        separatorBar!.autoConstrainAttribute(.MarginTop, toAttribute: .MarginTop, ofView: self, withMultiplier: 2)
        separatorBar!.autoPinEdge(.Left, toEdge: .Right, ofView: serviceView!)

        infoView!.autoPinEdge(.Left, toEdge: .Right, ofView: separatorBar!, withOffset: 8)
        infoView!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        infoView!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.55)
        infoView!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.7)
        
        timeLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: infoView!)
        timeLabel!.autoConstrainAttribute(.MarginTop, toAttribute: .MarginTop, ofView: infoView!)
        timeLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: infoView!, withMultiplier: 0.6)
        timeLabel!.autoMatchDimension(.Height, toDimension: .Height, ofView: infoView!, withMultiplier: 0.70)
        
        dateLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: timeLabel!)
        dateLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: timeLabel!, withOffset: -5)
        dateLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: infoView!)
        dateLabel!.autoMatchDimension(.Height, toDimension: .Height, ofView: timeLabel!, withMultiplier: 0.50)

        descriptionLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: infoView!)
        descriptionLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: timeLabel!)
        descriptionLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: infoView!)
        descriptionLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: infoView!)

        weekDaysView!.autoPinEdge(.Top, toEdge: .Bottom, ofView: infoView!)
        weekDaysView!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        weekDaysView!.autoPinEdge(.Left, toEdge: .Left, ofView: infoView!)
        weekDaysView!.autoPinEdge(.Right, toEdge: .Right, ofView: infoView!)

        alarmSwitch!.autoPinEdge(.Left, toEdge: .Right, ofView: infoView!, withOffset: 10)
        alarmSwitch!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        alarmSwitch!.autoConstrainAttribute(.MarginTop, toAttribute: .MarginTop, ofView: self, withMultiplier: 2)

    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
    }
    
}