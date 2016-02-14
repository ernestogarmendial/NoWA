//
//  AlarmService.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 7/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AlarmService: GenericService {

    func getPersonalAlarms(token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let alarmDAO: AlarmDAO = AlarmDAO()
        alarmDAO.delegate = self
        alarmDAO.getPersonalAlarms( token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "PersonalAlarms")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    func getTournamentAlarms(token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let alarmDAO: AlarmDAO = AlarmDAO()
        alarmDAO.delegate = self
        alarmDAO.getTournamentAlarms( token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "TournamentAlarms")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    func createAlarm(dateTime _dateTime : String,  eventDTO _eventDTO : EventDTO, alarmDTO _alarmDTO : AlarmDTO, token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let alarmDAO: AlarmDAO = AlarmDAO()
        alarmDAO.delegate = self
        alarmDAO.createAlarm(dateTime: _dateTime, eventDTO: _eventDTO, alarmDTO: _alarmDTO, token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "CreateAlarm")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    func editAlarm(dateTime _dateTime : String,  eventDTO _eventDTO : EventDTO, alarmDTO _alarmDTO : AlarmDTO, token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let alarmDAO: AlarmDAO = AlarmDAO()
        alarmDAO.delegate = self
        alarmDAO.editAlarm(dateTime: _dateTime, eventDTO: _eventDTO, alarmDTO: _alarmDTO, token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "EditAlarm")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }

    func deleteAlarm(alarmDTO _alarmDTO : AlarmDTO, token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let alarmDAO: AlarmDAO = AlarmDAO()
        alarmDAO.delegate = self
        alarmDAO.deleteAlarm(alarmDTO: _alarmDTO, token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "DeleteAlarm")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    func cancelAlarm(alarmID _alarmID : NSNumber, value _value : NSNumber, token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let alarmDAO: AlarmDAO = AlarmDAO()
        alarmDAO.delegate = self
        alarmDAO.cancelAlarm(alarmID: _alarmID, value: _value, token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "CancelAlarm")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    func checkAlarm(alarmID _alarmID : NSNumber, token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let alarmDAO: AlarmDAO = AlarmDAO()
        alarmDAO.delegate = self
        alarmDAO.checkAlarm(alarmID: _alarmID, token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "CheckAlarm")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
}
