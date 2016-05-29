//
//  RingtoneTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 4/5/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class RingtoneTableViewCell: GenericTableViewCell , pickerDelegate {
    
    var ringtone : NSString?
    var titleLabel : UILabel?
    var descriptionLabel : UILabel?
    var leftIcon : UIImageView?
    var rightButton : UIButton?
    var ringtones : [NSDictionary]?
    var ringtonesPicker: NSMutableArray! = NSMutableArray()
    var ringtonesArray: NSMutableArray! = NSMutableArray()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .serviceLocationColor()
        self.contentView.backgroundColor = .serviceLocationColor()
        
        
        leftIcon = UIImageView()
        leftIcon!.contentMode = UIViewContentMode.Center
        self.addSubview(leftIcon!)
        
        titleLabel = UILabel()
        titleLabel!.textColor = .whiteColor()
        titleLabel!.font = UIFont.appLatoFontOfSize(14)
        titleLabel!.adjustsFontSizeToFitWidth = true
        titleLabel!.textAlignment = .Left
        titleLabel!.numberOfLines = 1
        self.addSubview(titleLabel!)
        
        descriptionLabel = UILabel()
        descriptionLabel!.textColor = .whiteColor()
        descriptionLabel!.font = UIFont.appLatoFontOfSize(14)
        descriptionLabel!.adjustsFontSizeToFitWidth = true
        descriptionLabel!.textAlignment = .Left
        descriptionLabel!.numberOfLines = 1
        self.addSubview(descriptionLabel!)
        
        rightButton = UIButton()
        rightButton!.addTarget(self, action: "rightButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.addSubview(rightButton!)
        
        let defaultRingtone = "ringtone.mp3"
        if self.firstTimeEdit == false {
            descriptionLabel?.text = defaultRingtone
            ringtone = defaultRingtone
        }
        
        ringtonesArray.addObject(["ringtoneID": 0, "name": "ringtone"])
        ringtonesPicker.addObject("ringtone")
        ringtonesArray.addObject(["ringtoneID": 1, "name": "iphone_6_original"])
        ringtonesPicker.addObject("iphone_6_original")
        ringtonesArray.addObject(["ringtoneID": 2, "name": "Beacon"])
        ringtonesPicker.addObject("Beacon")
        ringtonesArray.addObject(["ringtoneID": 3, "name": "Bulletin"])
        ringtonesPicker.addObject("Bulletin")
        ringtonesArray.addObject(["ringtoneID": 4, "name": "By The Seaside"])
        ringtonesPicker.addObject("By The Seaside")
        ringtonesArray.addObject(["ringtoneID": 5, "name": "Chimes"])
        ringtonesPicker.addObject("Chimes")
        ringtonesArray.addObject(["ringtoneID": 6, "name": "Circuit"])
        ringtonesPicker.addObject("Circuit")
        ringtonesArray.addObject(["ringtoneID": 7, "name": "Constellation"])
        ringtonesPicker.addObject("Constellation")
        ringtonesArray.addObject(["ringtoneID": 8, "name": "Cosmic"])
        ringtonesPicker.addObject("Cosmic")
        ringtonesArray.addObject(["ringtoneID": 9, "name": "Crystals"])
        ringtonesPicker.addObject("Crystals")
        ringtonesArray.addObject(["ringtoneID": 10, "name": "Hillside"])
        ringtonesPicker.addObject("Hillside")
        ringtonesArray.addObject(["ringtoneID": 11, "name": "Illuminate"])
        ringtonesPicker.addObject("Illuminate")
        ringtonesArray.addObject(["ringtoneID": 12, "name": "Night Owl"])
        ringtonesPicker.addObject("Night Owl")
        ringtonesArray.addObject(["ringtoneID": 13, "name": "Opening"])
        ringtonesPicker.addObject("Opening")
        ringtonesArray.addObject(["ringtoneID": 14, "name": "Playtime"])
        ringtonesPicker.addObject("Playtime")
        ringtonesArray.addObject(["ringtoneID": 15, "name": "Presto"])
        ringtonesPicker.addObject("Presto")
        ringtonesArray.addObject(["ringtoneID": 16, "name": "Radar"])
        ringtonesPicker.addObject("Radar")
        ringtonesArray.addObject(["ringtoneID": 17, "name": "Radiate"])
        ringtonesPicker.addObject("Radiate")
        ringtonesArray.addObject(["ringtoneID": 18, "name": "Ripples"])
        ringtonesPicker.addObject("Ripples")
        ringtonesArray.addObject(["ringtoneID": 19, "name": "Sencha"])
        ringtonesPicker.addObject("Sencha")
        ringtonesArray.addObject(["ringtoneID": 20, "name": "Signal"])
        ringtonesPicker.addObject("Signal")
        ringtonesArray.addObject(["ringtoneID": 21, "name": "Silk"])
        ringtonesPicker.addObject("Silk")
        ringtonesArray.addObject(["ringtoneID": 22, "name": "Slow Rise"])
        ringtonesPicker.addObject("Slow Rise")
        ringtonesArray.addObject(["ringtoneID": 23, "name": "Stargaze"])
        ringtonesPicker.addObject("Stargaze")
        ringtonesArray.addObject(["ringtoneID": 24, "name": "Summit"])
        ringtonesPicker.addObject("Summit")
        ringtonesArray.addObject(["ringtoneID": 25, "name": "Twinkle"])
        ringtonesPicker.addObject("Twinkle")
        ringtonesArray.addObject(["ringtoneID": 26, "name": "Uplift"])
        ringtonesPicker.addObject("Uplift")
        ringtonesArray.addObject(["ringtoneID": 27, "name": "Waves"])
        ringtonesPicker.addObject("Waves")
        
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setItems(myDictionary: NSDictionary) {
        if let left_icon = myDictionary["left_icon"] as? String{
            leftIcon!.image = UIImage(named: left_icon)
        }
        if let right_icon = myDictionary["right_icon"] as? String{
            rightButton!.setImage(UIImage(named: right_icon), forState: UIControlState.Normal)
        }
        
        //        let language = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode)! as! String
        let lang =  NSLocale.preferredLanguages().first! as NSString
        let language = lang.substringWithRange(NSRange(location: 0, length: 2))
        
        if language == "en" {
            if let title = myDictionary["title_en"] as? String{
                titleLabel!.text = title
            }
        }else if language == "es" {
            
            if let title = myDictionary["title"] as? String{
                titleLabel!.text = title
            }
        }
    }
    
    override func resetValues(){
        descriptionLabel!.text = ringtonesArray[0].valueForKey("name") as? String
        ringtone = ringtonesArray[0].valueForKey("name") as? String
    }
    
    func setupConstrains(){
        
        leftIcon!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        leftIcon!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        leftIcon!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        leftIcon!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        
        titleLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        titleLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        titleLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        titleLabel!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.80)
        
        descriptionLabel!.autoConstrainAttribute(.MarginTop, toAttribute: .MarginBottom, ofView: self, withMultiplier: 0.5)
        descriptionLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        descriptionLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        descriptionLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        
        rightButton!.autoPinEdge(.Left, toEdge: .Right, ofView: titleLabel!)
        rightButton!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        rightButton!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        rightButton!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
    }
    
    
    func rightButtonPressed(){
        print("right ButtonPressedpressed")
        
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            let popupViewController = PopUpPickerViewController()
            popupViewController.locationsPicker = ringtonesPicker
            popupViewController.delegate = self
            rootViewController.addChildViewController(popupViewController)
            dispatch_async(dispatch_get_main_queue()) {
                popupViewController.view.frame = rootViewController.view.frame
                rootViewController.view.addSubview(popupViewController.view)
                popupViewController.didMoveToParentViewController(rootViewController)
                popupViewController.view.alpha = 0
                UIView.animateWithDuration(0.35, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    popupViewController.view.alpha = 1
                    }, completion: nil)
            }
        }
    }
    
    
    func pickerOptionSelected(selectedRow : Int){
        
        for ringtone in ringtonesArray! {
            
            let ringtoneID = ringtone.valueForKey("ringtoneID") as! NSNumber
            
            if ringtoneID == selectedRow {
                
                self.descriptionLabel!.text = ringtone.valueForKey("name") as? String
                
                self.ringtone = ringtone.valueForKey("name") as? String
                
                return
            }
            
        }
        //
    }
    
    override func setEditAlarm(editAlarmDTO: PersonalAlarmDTO, isEdit: Bool, status: NSNumber?) {
        
        if self.firstTimeEdit == false {
            
            let event = editAlarmDTO.event![0] as? EventDTO
            let weather = editAlarmDTO.weather![0] as? AlarmDTO
            
            for ringtone in ringtonesArray! {
                
                let ringtone = ringtone.valueForKey("name") as! String
                
                if ringtone == event?.ringtone {
                    
                    descriptionLabel!.text = ringtone as? String//ringtone.valueForKey("name") as? String
                    self.ringtone = ringtone as? String//ringtone.valueForKey("name") as? String
                    
                    
                    self.firstTimeEdit = true
                    return
                }
                
            }
            
            
        }
    }
    
    
    
}
