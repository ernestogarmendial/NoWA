//
//  DefaultCancelTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 1/28/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

protocol DefaultCellDelegate {
    func defaultButtonPressed() -> Void
    func defaultButtonDisabled() -> Void
}

class DefaultCancelTableViewCell: GenericTableViewCell {
    
    var cancelationView : UIView?
    var cancelationLabel : UILabel?
    var adviceLabel : UILabel?
    var switchButton : UIButton?
    var isSwtichActive : NSNumber?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .serviceLocationColor()
        self.contentView.backgroundColor = .serviceLocationColor()
        
        cancelationView = UIView()
        cancelationView?.backgroundColor = .ribbonAltColor()
        self.addSubview(cancelationView!)
        
        cancelationLabel = UILabel()
        cancelationLabel!.text = NSLocalizedString("Rango de Cancelación", comment: "")
        cancelationLabel!.textColor = .whiteColor()
        cancelationLabel!.font = UIFont.appLatoFontOfSize(14)
        cancelationLabel!.adjustsFontSizeToFitWidth = true
        cancelationLabel!.textAlignment = .Left
        cancelationLabel!.numberOfLines = 1
        cancelationView!.addSubview(cancelationLabel!)
        
        switchButton = UIButton()
        switchButton!.addTarget(self, action: #selector(DefaultCancelTableViewCell.switchPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        switchButton!.setImage(UIImage(named: "switch_off"), forState: UIControlState.Normal)
        switchButton!.setImage(UIImage(named: "switch_on"), forState: UIControlState.Selected)
        cancelationView!.addSubview(switchButton!)
        
        adviceLabel = UILabel()
        adviceLabel!.text = NSLocalizedString("ATENCION! Cualquiera de estos parámetros definirán la cancelación de tus alarmas"
            , comment: "")
        adviceLabel!.textColor = .whiteColor()
        adviceLabel!.font = UIFont.appLatoFontOfSize(14)
        adviceLabel!.adjustsFontSizeToFitWidth = true
        adviceLabel!.textAlignment = .Center
        adviceLabel!.numberOfLines = 2
        self.addSubview(adviceLabel!)
        
        let myMutableString = NSMutableAttributedString(string: adviceLabel!.text!, attributes: [NSFontAttributeName:UIFont.appLatoFontOfSize(14)])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.loginRedColor(), range: NSRange(location:0,length:9))
        
        adviceLabel!.attributedText = myMutableString
        setupConstrains()
    }
    
    
    func switchPressed (sender:UIButton) {
        
        sender.selected = !sender.selected;
        
        if sender.selected == true {
            self.defaultDelegate?.defaultButtonPressed()
            isSwtichActive = 1
        } else {
            self.defaultDelegate?.defaultButtonDisabled()
            isSwtichActive = 0
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setItems(myDictionary: NSDictionary) {
        
    }
    
    func setupConstrains(){
        
        cancelationView!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        cancelationView!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        cancelationView!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        cancelationView!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        cancelationView!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.35)
        
        cancelationLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: cancelationView!, withOffset: 20)
        cancelationLabel!.autoPinEdge(.Right, toEdge: .Left, ofView: switchButton!)
        cancelationLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: cancelationView!)
        cancelationLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: cancelationView!)
        
        adviceLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: cancelationView!, withMultiplier: 0.8)
        adviceLabel?.autoAlignAxis(.Vertical, toSameAxisOfView: self)
        adviceLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        adviceLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: cancelationView!)
        
        switchButton!.autoSetDimension(.Width, toSize: 38)
        switchButton!.autoPinEdge(.Right, toEdge: .Right, ofView: cancelationView!, withOffset: -20)
        switchButton!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: cancelationView!, withOffset: -3)
        switchButton!.autoPinEdge(.Top, toEdge: .Top, ofView: cancelationView!, withOffset: 3)
        
        
    }
    
    override func setEditAlarm(editAlarmDTO: PersonalAlarmDTO, isEdit: Bool, status: NSNumber?) {
        
        let event = editAlarmDTO.event![0] as? EventDTO
        let weather = editAlarmDTO.weather![0] as? AlarmDTO
        
        
        if editSeted == false {
        if event!.useDefault == 1 {
            switchButton!.selected = true
        }
            editSeted = true
        }
        
    }
}
