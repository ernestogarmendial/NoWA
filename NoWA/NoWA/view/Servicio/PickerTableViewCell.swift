//
//  PickerTableViewCell
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PickerTableViewCell: GenericTableViewCell, pickerDelegate {
    
    var condition : NSNumber?
    //    var defaultSeted : Bool! = false
    var titleLabel : UILabel?
    var descriptionLabel : UILabel?
    var leftIcon : UIImageView?
    var rightButton : UIButton?
    var conditions : [ConditionDTO]?
    var conditionsPicker:NSMutableArray!
    
    static var conditionsArray : NSMutableArray! = NSMutableArray()
    
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
        
        callService()
        
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
    
    
    func callService(){
        let weatherService : WeatherService = WeatherService()
        weatherService.getConditions(token: UserService.currentUser.token,target: self,message: "getConditionsFinish:")
    }
    
    func getConditionsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        self.conditions = (result.entityForKey("Conditions") as! [ConditionDTO])
        
        conditionsPicker = NSMutableArray()
        
        
        
        for condition in conditions! {
            conditionsPicker.addObject(condition.name!)
            if self.condition == nil {
                self.condition = condition.conditionID
                self.descriptionLabel!.text = condition.name
            }
            let conditionsDict = NSMutableDictionary()

            conditionsDict.setValue(condition.conditionID, forKey: "conditionID")
            conditionsDict.setValue(condition.name, forKey: "name")
            
            PickerTableViewCell.conditionsArray.addObject(conditionsDict)
            
        }
        
    }
    
    
    func rightButtonPressed(){
        print("right ButtonPressedpressed")
        
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            let popupViewController = PopUpPickerViewController()
            popupViewController.locationsPicker = conditionsPicker
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
        self.descriptionLabel!.text = self.conditions![selectedRow].name!
        self.condition = self.conditions![selectedRow].conditionID!
    }
    
    override func setDefaults(defaultDTO: AlarmDTO,isCreate: Bool){
        if self.defaultSeted == false || isCreate == true{
            if let condition = defaultDTO.condition{
                
                self.condition = condition
                
                let delay = 1 * Double(NSEC_PER_SEC)
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
                    if self.conditions != nil {
                        for cond in self.conditions!{
                            if cond.conditionID == condition{
                                self.descriptionLabel!.text = cond.name
                                self.defaultSeted = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func setEditAlarm(editAlarmDTO: PersonalAlarmDTO, isCreate: Bool, status: NSNumber?) {
        
        let event = editAlarmDTO.event![0] as? EventDTO
        let weather = editAlarmDTO.weather![0] as? AlarmDTO
        
        for condition in PickerTableViewCell.conditionsArray! {
            
            let conditionID = condition.valueForKey("conditionID") as! NSNumber
            
            if conditionID == weather?.condition {
                
                descriptionLabel!.text = condition.valueForKey("name") as? String
                
                return
            }
            
        }
        
        
    }
    
}
