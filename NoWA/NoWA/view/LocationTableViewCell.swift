//
//  LocationTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/30/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

protocol LocationTableViewCellDelegate: class {
    func showAlert()
}

class LocationTableViewCell: GenericTableViewCell,pickerDelegate {
    
    var place : String?
    
    var titleLabel : UILabel?
    var locationTextField : UITextField?
    var leftIcon : UIImageView?
    var rightButton : UIButton?
    var locations : [LocationDTO]?
    var locationsPicker:NSMutableArray!
    
    static var locationsArray : NSMutableArray! = NSMutableArray()
    
    var firstTime : Bool = true
    
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
        
        locationTextField = UITextField()
        locationTextField!.delegate = self
        locationTextField!.attributedPlaceholder =  NSAttributedString(string: "Ingresa el lugar donde hagas el deporte",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        if self.place != nil{
            locationTextField!.text = self.place!
        }
        locationTextField!.textColor = UIColor.whiteColor()
        locationTextField!.keyboardType = UIKeyboardType.Default
        locationTextField!.clearButtonMode = .WhileEditing
        locationTextField!.font = UIFont.appLatoFontOfSize(13)
        locationTextField!.adjustsFontSizeToFitWidth = true
        self.addSubview(locationTextField!)
        
        rightButton = UIButton()
        rightButton!.addTarget(self, action: "rightButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.addSubview(rightButton!)
        
        
        let weatherService : WeatherService = WeatherService()
        weatherService.getLocations(name: "%", token: UserService.currentUser.token,target: self,message: "getLocationsFinish:")
        
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
        
        if let title = myDictionary["title"] as? String{
            titleLabel!.text = title
        }
    }
    
    override func resetValues(){
        locationTextField!.text = ""
    }
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        super.textFieldShouldReturn(textField)
        rightButtonPressed()
        return true
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
        
        locationTextField!.autoConstrainAttribute(.MarginTop, toAttribute: .MarginBottom, ofView: self, withMultiplier: 0.5)
        locationTextField!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        locationTextField!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        locationTextField!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        
        rightButton!.autoPinEdge(.Left, toEdge: .Right, ofView: titleLabel!)
        rightButton!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        rightButton!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        rightButton!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
    }
    
    func rightButtonPressed(){
        print("pepe")
        
        callService()
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print(textField.text)
        
        var ok : Bool = false
        for location in LocationTableViewCell.locationsArray{
            if location as? String == textField.text{
                ok = true
            }
        }
        
        if ok == false{
            locationDelegate?.showAlert()
            return
        }
        
    }
    
    func callService(){
        
        var locationName = locationTextField?.text
        if locationName == ""{
            locationName = "%"
        }
        
        let weatherService : WeatherService = WeatherService()
        weatherService.getLocations(name: locationName, token: UserService.currentUser.token,target: self,message: "getLocationsFinish:")
        
        
    }
    
    
    
    
    
    func getLocationsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        dispatch_async(dispatch_get_main_queue()) {
            self.locationTextField!.resignFirstResponder()
        }
        
        self.locations = (result.entityForKey("Locations") as! [LocationDTO])
        
        locationsPicker = NSMutableArray()
        
        for location in locations! {
            locationsPicker.addObject(location.name!)
            if firstTime == true{
                LocationTableViewCell.locationsArray.addObject(location.name!)
            }
        }
        
        if firstTime == false{
            
            if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
                let popupViewController = PopUpPickerViewController()
                popupViewController.locationsPicker = locationsPicker
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
        firstTime = false
        
    }
    
    func pickerOptionSelected(selectedRow : Int){
        self.locationTextField!.text = (self.locations![selectedRow].name as! String)
        self.place = (self.locations![selectedRow].name as! String)
    }
    
    override func setDefaults(defaultDTO: AlarmDTO,isCreate: Bool){
        
        if !defaultSeted || isCreate == true{
            
            if let place = defaultDTO.place{
                self.place = place
                self.locationTextField!.text = place
                defaultSeted = true
                
                
            }
        }
    }
    
    override func setEditAlarm(editAlarmDTO: PersonalAlarmDTO, isEdit: Bool, status: NSNumber?) {
        
        if self.firstTimeEdit == false {
            
            let event = editAlarmDTO.event![0] as? EventDTO
            let weather = editAlarmDTO.weather![0] as? AlarmDTO
            
            
            locationTextField!.text = weather?.place
            
            self.firstTimeEdit = true
        }
    }
    
}
