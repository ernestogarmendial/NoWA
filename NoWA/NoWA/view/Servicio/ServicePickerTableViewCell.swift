//
//  ServicePickerTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ServicePickerTableViewCell: GenericTableViewCell, pickerDelegate {
    
    var service : NSNumber? // el que va a set / update
    
    var serviceLabel : UILabel?
    var selectedServiceLabel : UILabel?
    var pickerArrow : UIButton?
    var forecasts : [ForecastDTO]?
    var forecastsPicker:NSMutableArray!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .servicePickerBlueColor()
        self.contentView.backgroundColor = .servicePickerBlueColor()
        
        
        serviceLabel = UILabel()
        serviceLabel!.text = "SERVICIO"
        serviceLabel!.textColor = .whiteColor()
        serviceLabel!.font = UIFont.appLatoFontOfSize(14)
        serviceLabel!.adjustsFontSizeToFitWidth = true
        serviceLabel!.textAlignment = .Center
        serviceLabel!.numberOfLines = 1
        self.addSubview(serviceLabel!)
        
        selectedServiceLabel = UILabel()
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
        
        callService()
        
        setupConstrains()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setItems(myDictionary: NSDictionary) {
        
    }
    
    func setupConstrains(){
        
        serviceLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        serviceLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        serviceLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        serviceLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.25)
        
        selectedServiceLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: serviceLabel!)
        selectedServiceLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        selectedServiceLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        selectedServiceLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.50)
        
        
        pickerArrow!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.25)
        pickerArrow!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        pickerArrow!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        pickerArrow!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        
    }
    
    func pickerArrowPressed(){
        print("service picker pressed")
        
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            let popupViewController = PopUpPickerViewController()
            popupViewController.locationsPicker = forecastsPicker
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
    
    func callService(){
        let weatherService : WeatherService = WeatherService()
        weatherService.getForecasts(token: UserService.currentUser.token,target: self,message: "getForecastsFinish:")
    }
    
    func getForecastsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        self.forecasts = (result.entityForKey("Forecasts") as! [ForecastDTO])
        
        forecastsPicker = NSMutableArray()
        
        for forecast in forecasts! {
            forecastsPicker.addObject(forecast.name!)
            if self.service == nil{
                self.service = forecast.forecastID
                self.selectedServiceLabel!.text = forecast.name
                
            }
        }
    }
    
    func pickerOptionSelected(selectedRow : Int){
        self.selectedServiceLabel!.text = self.forecasts![selectedRow].name!
        self.service = self.forecasts![selectedRow].forecastID!
    }
    
    override func setDefaults(defaultDTO: AlarmDTO,isCreate: Bool){
        if self.defaultSeted == false || isCreate == true{
            
            if let service = defaultDTO.service{
                
                self.service = service
                
                let delay = 1 * Double(NSEC_PER_SEC)
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
                    if self.forecasts != nil{
                        for forecast in self.forecasts!{
                            if forecast.forecastID == service{
                                self.selectedServiceLabel!.text = forecast.name
                                self.defaultSeted = true
                                
                            }
                        }
                    }
                }
            }
        }
        
    }
}
