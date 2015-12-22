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
    var weekDayView : WeekDaysView?
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
        timeLabel!.font = UIFont.appLatoFontOfSize(30)
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
        descriptionLabel!.font = UIFont.appLatoFontOfSize(14)
        descriptionLabel!.adjustsFontSizeToFitWidth = true
        descriptionLabel!.textAlignment = .Left
        descriptionLabel!.numberOfLines = 1
        self.addSubview(descriptionLabel!)
        
        alarmSwitch = UISwitch()
        alarmSwitch?.setOn(true, animated: true)
        
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
//         weekDayView
//         alarmSwitch
        
        serviceView!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        serviceView!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        serviceView!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        serviceView!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.2)
        
        serviceIcon!.autoAlignAxis(.Vertical, toSameAxisOfView: serviceView!)
        serviceIcon!.autoConstrainAttribute(.MarginTop, toAttribute: .MarginTop, ofView: self, withMultiplier: 2)
        serviceIcon!.autoSetDimension(.Width, toSize: 30)
        serviceIcon!.autoSetDimension(.Height, toSize: 30)
        
        serviceLabel!.autoAlignAxis(.Vertical, toSameAxisOfView: serviceView!)
        serviceLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: serviceView!, withOffset: 5)
        serviceLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: serviceView!, withOffset: -5)
        serviceLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: serviceIcon!, withOffset: 5)
        serviceIcon!.autoSetDimension(.Height, toSize: 40)
    
        separatorBar!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.8)
        separatorBar!.autoSetDimension(.Width, toSize: 1.5)
        separatorBar!.autoConstrainAttribute(.MarginTop, toAttribute: .MarginTop, ofView: self, withMultiplier: 2)
        separatorBar!.autoPinEdge(.Left, toEdge: .Right, ofView: serviceView!)

        
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
    }
    
}
