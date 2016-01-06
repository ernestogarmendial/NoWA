//
//  WeatherService.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 28/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class WeatherService: GenericService {
    
    func getForecasts(token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let weatherDAO: WeatherDAO = WeatherDAO()
        weatherDAO.delegate = self
        weatherDAO.getForecasts( token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "Forecasts")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    
    func getConditions(token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let weatherDAO: WeatherDAO = WeatherDAO()
        weatherDAO.delegate = self
        weatherDAO.getConditions( token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "Conditions")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    
    func getLocations(name _name: String?, token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let weatherDAO: WeatherDAO = WeatherDAO()
        weatherDAO.delegate = self
        weatherDAO.getLocations(name: _name, token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "Locations")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    func setDefault(weatherDTO _weatherDTO: AlarmDTO?, token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let weatherDAO: WeatherDAO = WeatherDAO()
        weatherDAO.delegate = self
        weatherDAO.setDefault(weatherDTO: _weatherDTO, token: _token, handler: { (operation, result) in
            let defaultDTO = result as? AlarmDTO;
            
            if(defaultDTO == nil){
                serviceResult.addErrorsFromDTO(defaultDTO!)
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }else{
                
                serviceResult.addEntity(defaultDTO, forKey: "SetDefault")
                
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }
        })
    }
    func getDefault(token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let weatherDAO: WeatherDAO = WeatherDAO()
        weatherDAO.delegate = self
        weatherDAO.getDefault(token: _token, handler: { (operation, result) in
            let defaultDTO = result as? AlarmDTO;
            
            if(defaultDTO == nil){
                serviceResult.addErrorsFromDTO(defaultDTO!)
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }else{
                
                serviceResult.addEntity(defaultDTO, forKey: "GetDefault")
                
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }
        })
    }
    
}
