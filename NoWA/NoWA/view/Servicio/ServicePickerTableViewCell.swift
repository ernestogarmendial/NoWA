//
//  ServicePickerTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ServicePickerTableViewCell: GenericTableViewCell {

    var serviceLabel : UILabel?
    var selectedServiceLabel : UILabel?
    var pickerArrow : UIButton?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .servicePickerBlueColor()
        self.contentView.backgroundColor = .servicePickerBlueColor()
        
        serviceLabel = UILabel()
        serviceLabel!.text = "SERVICIO"
        serviceLabel!.textColor = .whiteColor()
        serviceLabel!.font = UIFont.appLatoFontOfSize(14)
        serviceLabel!.adjustsFontSizeToFitWidth = true
        serviceLabel!.textAlignment = .Left
        serviceLabel!.numberOfLines = 1
        self.addSubview(serviceLabel!)
        
        selectedServiceLabel = UILabel()
        selectedServiceLabel!.text = "YR"
        selectedServiceLabel!.textColor = .whiteColor()
        selectedServiceLabel!.font = UIFont.appLatoFontOfSize(26)
        selectedServiceLabel!.adjustsFontSizeToFitWidth = true
        selectedServiceLabel!.textAlignment = .Center
        selectedServiceLabel!.numberOfLines = 1
        self.addSubview(selectedServiceLabel!)
        
        pickerArrow = UIButton()
        pickerArrow!.addTarget(self, action: "pickerArrowPressed", forControlEvents: UIControlEvents.TouchUpInside)
        pickerArrow!.setImage(UIImage(named: "down_arrow"), forState: UIControlState.Normal)
        self.addSubview(pickerArrow!)

        
        setupConstrains()
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setItems(myDictionary: NSDictionary) {
        
    }
    
    func setupConstrains(){

        serviceLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: self, withOffset: 20)
        serviceLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        serviceLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        serviceLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.30)
        
        selectedServiceLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: serviceLabel!)
        selectedServiceLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        selectedServiceLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        selectedServiceLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.40)

        pickerArrow!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        pickerArrow!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        pickerArrow!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        pickerArrow!.autoPinEdge(.Right, toEdge: .Right, ofView: self)

    }
    
    func pickerArrowPressed(){
        print("gonzagato")
    }
}
