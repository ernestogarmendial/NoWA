//
//  NewAlarmInsertTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 15/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class NewAlarmInsertTableViewCell: GenericTableViewCell {
    
    var newAlertLabel : UILabel?
    var nameTextField : UITextField?
    var timeLabel: UITextField?
    var datePicker : UIDatePicker?
    var daysButtonsView : DaysButtonsView?
    var amPmFormat : Bool! = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clearColor()
        self.contentView.backgroundColor = .clearColor()
        
        newAlertLabel = UILabel()
        newAlertLabel!.textColor = .whiteColor()
        newAlertLabel!.font = UIFont.appLatoFontOfSize(14)
        newAlertLabel!.adjustsFontSizeToFitWidth = true
        newAlertLabel!.textAlignment = .Center
        newAlertLabel!.numberOfLines = 1
        self.addSubview(newAlertLabel!)
        
        nameTextField = UITextField()
        nameTextField?.delegate = self
        nameTextField!.attributedPlaceholder =  NSAttributedString(string: NSLocalizedString("INGRESÁ UN NOMBRE ...", comment: "")
            ,
                                                                   attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        nameTextField!.textColor = .whiteColor()
        nameTextField!.font = UIFont.appLatoFontOfSize(16)
        nameTextField!.adjustsFontSizeToFitWidth = true
        nameTextField!.keyboardType = UIKeyboardType.Default
        nameTextField!.clearButtonMode = .WhileEditing
        nameTextField!.textAlignment = .Left
        self.addSubview(nameTextField!)
        
        datePicker = UIDatePicker()
        datePicker!.datePickerMode = UIDatePickerMode.Time
        datePicker!.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        datePicker?.backgroundColor = .ribbonAltColor()
        datePicker!.addTarget(self, action: "onDatePickerValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .Default
        toolbar.translucent = false
        toolbar.backgroundColor = .whiteColor()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "OK", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("done"))
        doneButton.tintColor = .blackColor()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexibleSpace,doneButton,flexibleSpace], animated: false)
        toolbar.userInteractionEnabled = true
        
        timeLabel = UITextField()
        timeLabel!.text = "00:00"
        timeLabel!.textColor = .whiteColor()
        timeLabel!.font = UIFont.appLatoFontOfSize(60)
        timeLabel!.adjustsFontSizeToFitWidth = true
        timeLabel!.textAlignment = .Left
        timeLabel!.inputView = datePicker!
        timeLabel!.backgroundColor = .redColor()
        timeLabel!.inputAccessoryView = toolbar
        self.addSubview(timeLabel!)
        
        
        
        daysButtonsView = DaysButtonsView()
        self.addSubview(daysButtonsView!)
        
        
        let locale = NSLocale.currentLocale()
        
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("j", options: 0, locale: locale)!
        
        if dateFormat.rangeOfString("a") != nil {
            print("12 hour")
            amPmFormat = true
        }
        else {
            print("24 hour")
            amPmFormat = false
        }
        
        setupConstrains()
    }
    
    func done(){
        timeLabel?.resignFirstResponder()
    }
    
    func onDatePickerValueChanged(datePicker: UIDatePicker){
        let dateFormatter = NSDateFormatter()
        
        if amPmFormat == false {
            dateFormatter.dateFormat = "hh:mm"
            //            timeLabel!.text = String(dateFormatter.stringFromDate(datePicker.date))
            
        }
        else {
            dateFormatter.dateFormat = "hh:mm a"
            //            let date = dateFormatter.dateFromString(String(dateFormatter.stringFromDate(datePicker.date)))
            //
            //            dateFormatter.dateFormat = "HH:mm"
            //            let date24 : String! = dateFormatter.stringFromDate(date!)
            //            print(date24)
            //            timeLabel!.text = date24
        }
        timeLabel!.text = String(dateFormatter.stringFromDate(datePicker.date))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        
        newAlertLabel?.autoPinEdge(.Top, toEdge: .Top, ofView: self, withOffset: 5)
        newAlertLabel?.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        newAlertLabel?.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        
        nameTextField?.autoPinEdge(.Top, toEdge: .Bottom, ofView: newAlertLabel!, withOffset: 15)
        nameTextField?.autoPinEdge(.Left, toEdge: .Left, ofView: self, withOffset: 10)
        nameTextField?.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        
        timeLabel?.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameTextField!, withOffset: 10)
        timeLabel?.autoPinEdge(.Left, toEdge: .Left, ofView: self, withOffset: 10)
        //        timeLabel?.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        timeLabel?.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.7)
        
        
        daysButtonsView?.autoPinEdge(.Top, toEdge: .Bottom, ofView: timeLabel!)
        daysButtonsView?.autoPinEdge(.Left, toEdge: .Left, ofView: self, withOffset: 10)
        daysButtonsView?.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        daysButtonsView?.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        
    }
    
    override func setItems(myDictionary: NSDictionary){
        
        //        let language = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode)! as! String
        let lang =  NSLocale.preferredLanguages().first! as NSString
        let language = lang.substringWithRange(NSRange(location: 0, length: 2))
        
        if language == "en" {
            if let newAlertLabelText = myDictionary["title_en"] as? String{
                newAlertLabel!.text = newAlertLabelText
            }
        }else if language == "es" {
            
            if let newAlertLabelText = myDictionary["title"] as? String{
                newAlertLabel!.text = newAlertLabelText
            }
        }
        
        if amPmFormat == false {
            
        } else {
            
        }
        
        let dateString = timeLabel!.text
        let df = NSDateFormatter()
        df.dateFormat = "hh:mm"
        let date = df.dateFromString(dateString!)
        if let unwrappedDate = date {
            datePicker!.setDate(unwrappedDate, animated: false)
        }
    }
    
    override func setEditAlarm(editAlarmDTO: PersonalAlarmDTO, isEdit: Bool, status: NSNumber?) {
        
        if self.firstTimeEdit == false {
            
            let event = editAlarmDTO.event![0] as? EventDTO
            let weather = editAlarmDTO.weather![0] as? AlarmDTO
            
            self.nameTextField!.text = event?.name
            
            
            
            
            let stamp = event!.stamp! as NSString
            
            timeLabel!.text = stamp.substringWithRange(NSRange(location: 11, length: 5))
            
            let dateString = timeLabel!.text
            let df = NSDateFormatter()
            df.dateFormat = "hh:mm"
            let date = df.dateFromString(dateString!)
            if let unwrappedDate = date {
                datePicker!.setDate(unwrappedDate, animated: false)
            }
            
            let hour = stamp.substringWithRange(NSRange(location: 11, length: 2))
            let min = stamp.substringWithRange(NSRange(location: 14, length: 2))
            
            if amPmFormat == false {
                self.timeLabel!.text = "\(hour):\(min)"
            } else {
                var hourAMPM : String!
                switch hour {
                case "00":
                    hourAMPM = "12"
                case "13":
                    hourAMPM = "01"
                case "14":
                    hourAMPM = "02"
                case "15":
                    hourAMPM = "03"
                case "16":
                    hourAMPM = "04"
                case "17":
                    hourAMPM = "05"
                case "18":
                    hourAMPM = "06"
                case "19":
                    hourAMPM = "07"
                case "20":
                    hourAMPM = "08"
                case "21":
                    hourAMPM = "09"
                case "22":
                    hourAMPM = "10"
                case "23":
                    hourAMPM = "11"
                case "24":
                    hourAMPM = "12"
                default:
                    print("default")
                }
                
                if hourAMPM != nil{
                    self.timeLabel!.text = "\(hourAMPM):\(min) PM"
                } else {
                    self.timeLabel!.text = "\(hour):\(min) AM"
                }
                
            }
            
            
            
            
            
            
            
            
            
            
            if let daysString : String = event!.repetition{
                let daysArray : NSArray = daysString.componentsSeparatedByString(",")
                if status == 0{
                    daysButtonsView?.setDaysColor(UIColor.daysInactiveColor())
                    daysButtonsView?.showDays(daysArray, color: UIColor.daysInactiveColor(),isActive: false)
                }else{
                    daysButtonsView?.setDaysColor(UIColor.daysInactiveColor())
                    daysButtonsView?.showDays(daysArray, color: UIColor.daysActiveColor(),isActive: true)
                }
            }
            
            self.firstTimeEdit = true
            
        }
    }
    
    override func hideRepetition() {
        self.daysButtonsView?.hidden = true
        //        self.nameTextField?.hidden = true
        
        self.contentView.removeConstraints(self.contentView.constraints)
        
        
    }
    
    override func setEditTournament(editTournamentDTO: TournamentDTO, isEdit: Bool, status: NSNumber?) {
        self.nameTextField!.text = editTournamentDTO.name
        
        let stamp = editTournamentDTO.stamp! as NSString
        
        timeLabel!.text = stamp.substringWithRange(NSRange(location: 11, length: 5))
        
        let dateString = timeLabel!.text
        let df = NSDateFormatter()
        df.dateFormat = "hh:mm"
        let date = df.dateFromString(dateString!)
        if let unwrappedDate = date {
            datePicker!.setDate(unwrappedDate, animated: false)
        }
        
        
        let hour = stamp.substringWithRange(NSRange(location: 11, length: 2))
        let min = stamp.substringWithRange(NSRange(location: 14, length: 2))
        
        if amPmFormat == false {
            self.timeLabel!.text = "\(hour):\(min)"
        } else {
            var hourAMPM : String!
            switch hour {
            case "00":
                hourAMPM = "12"
            case "13":
                hourAMPM = "01"
            case "14":
                hourAMPM = "02"
            case "15":
                hourAMPM = "03"
            case "16":
                hourAMPM = "04"
            case "17":
                hourAMPM = "05"
            case "18":
                hourAMPM = "06"
            case "19":
                hourAMPM = "07"
            case "20":
                hourAMPM = "08"
            case "21":
                hourAMPM = "09"
            case "22":
                hourAMPM = "10"
            case "23":
                hourAMPM = "11"
            case "24":
                hourAMPM = "12"
            default:
                print("default")
            }
            
            if hourAMPM != nil{
                self.timeLabel!.text = "\(hourAMPM):\(min) PM"
            } else {
                self.timeLabel!.text = "\(hour):\(min) AM"
            }
            
        }

        
    }
    
    
}
