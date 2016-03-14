//
//  AlarmDAO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 7/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AlarmDAO: GenericDAO {
    
    func getPersonalAlarms(token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = PersonalAlarmDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: "events", statusCodes: nil)
        
        let originalURL = "alarms/personal/\(_token)/"
        
        var url = self.encodeURL(originalURL)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: url,
            parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            if response != nil{
                let array = response.array() as NSArray
                self.finish(array)
            }else{
                self.finish([])
            }
            },
            failure: { (operation, error) in
                self.printResponse(operation)
                self.finish(nil)
        })
        operation.start()
    }
    
    func getTournamentAlarms(token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = TournamentDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: "events", statusCodes: nil)
        
        let originalURL = "alarms/tournament/\(_token)/"
        
        var url = self.encodeURL(originalURL)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: url,
            parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            if response != nil{
                let array = response.array() as NSArray
                self.finish(array)
            }else{
                self.finish([])
            }
            },
            failure: { (operation, error) in
                self.printResponse(operation)
                self.finish(nil)
        })
        operation.start()
    }
    
    
    func createAlarm(dateTime _dateTime : String, eventDTO _eventDTO : EventDTO, alarmDTO _alarmDTO: AlarmDTO!, token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = PersonalAlarmDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let place : String!
        if _alarmDTO!.place == ""{
            place = "-"
        }else{
            place = _alarmDTO!.place
        }
        
        let name : String!
        if _eventDTO.name == nil{
            name = "-"
        }else{
            name = _eventDTO.name
        }
        
        let description : String!
        if _eventDTO.eventDescription == nil{
            description = "-"
        }else{
            description = _eventDTO.eventDescription
        }
        
        let zone : String!
        if _eventDTO.eventZone == nil{
            zone = "-"
        }else{
            zone = _eventDTO.eventZone
        }
        
        let repetition : String!
        if _eventDTO.repetition == nil{
            repetition = "-"
        }else{
            repetition = _eventDTO.repetition
        }
        
        let originalURL = "alarms/create/\(_dateTime)/\(name)/\(description)/\(zone)/\(repetition)/\(_alarmDTO.condition!.intValue)/\(_alarmDTO.prediction!.intValue)/\(_alarmDTO.minTemp!.intValue)/\(_alarmDTO.maxTemp!.intValue)/\(_alarmDTO.minHumidity!.intValue)/\(_alarmDTO.maxHumidity!.intValue)/\(_alarmDTO.minWind!.intValue)/\(_alarmDTO.maxWind!.intValue)/\(_alarmDTO.minSnow!.intValue)/\(_alarmDTO.maxSnow!.intValue)/\(_alarmDTO.service!.intValue)/\(place)/default/\(_token)/"
        
        var url = self.encodeURL(originalURL)
        
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: url,
            parameters: nil)
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let defaultDTO = response.array()[0] as! PersonalAlarmDTO
            self.finish(defaultDTO)
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }
    
    func cancelAlarm(alarmID _alarmID : NSNumber!,tournamentIDs _tournamentIDs : String, value _value : NSNumber!,token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = PersonalAlarmDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let originalURL : String?
        if _alarmID != 0{
            originalURL  = "alarms/toggle/\(_alarmID)/\(_value)/\(_token)/"
        }else{
            originalURL = "alarms/toggle/\(_tournamentIDs)/\(_value)/\(_token)/"
        }
        
        var url = self.encodeURL(originalURL!)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: url,
            parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            if response != nil{
                let array = response.array() as NSArray
                self.finish(array)
            }else{
                self.finish(nil)
            }
            },
            failure: { (operation, error) in
                self.printResponse(operation)
                self.finish(nil)
        })
        operation.start()
    }
    
    
    func checkAlarm(alarmID _alarmID : NSNumber!,token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = RKObjectMapping(forClass: CheckAlarmDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            "active": "active"
            ])
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let originalURL = "alarms/check/\(_alarmID)/\(_token)/"
        
        var url = self.encodeURL(originalURL)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: url,
            parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let checkAlarmDTO = response.array()[0] as! CheckAlarmDTO
            self.finish(checkAlarmDTO)
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }
    
    func editAlarm(dateTime _dateTime : String, eventDTO _eventDTO : EventDTO, alarmDTO _alarmDTO: AlarmDTO!, token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = PersonalAlarmDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let place : String!
        if _alarmDTO!.place == ""{
            place = "-"
        }else{
            place = _alarmDTO!.place
        }
        
        let name : String!
        if _eventDTO.name == nil{
            name = "-"
        }else{
            name = _eventDTO.name
        }
        
        let description : String!
        if _eventDTO.eventDescription == nil{
            description = "-"
        }else{
            description = _eventDTO.eventDescription
        }
        
        let zone : String!
        if _alarmDTO!.place == ""{
            zone = "-"
        }else{
            zone = _alarmDTO!.place
        }
        
        let repetition : String!
        if _eventDTO.repetition == nil{
            repetition = "-"
        }else{
            repetition = _eventDTO.repetition
        }
        
        let originalURL = "alarms/update/\(_alarmDTO.alarmID!)/\(_dateTime)/\(name)/\(description)/\(zone)/\(repetition)/\(_alarmDTO.condition!.intValue)/\(_alarmDTO.prediction!.intValue)/\(_alarmDTO.minTemp!.intValue)/\(_alarmDTO.maxTemp!.intValue)/\(_alarmDTO.minHumidity!.intValue)/\(_alarmDTO.maxHumidity!.intValue)/\(_alarmDTO.minWind!.intValue)/\(_alarmDTO.maxWind!.intValue)/\(_alarmDTO.minSnow!.intValue)/\(_alarmDTO.maxSnow!.intValue)/\(_alarmDTO.service!.intValue)/\(place)/default/\(_token)/"
        var url = self.encodeURL(originalURL)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: url,
            parameters: nil)
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let defaultDTO = response.array()[0] as! PersonalAlarmDTO
            self.finish(defaultDTO)
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }
    
    func deleteAlarm(alarmDTO _alarmDTO: AlarmDTO!, token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = PersonalAlarmDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let originalURL = "alarms/delete/\(_alarmDTO.alarmID!)/\(_token)/"
        var url = self.encodeURL(originalURL)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: url,
            parameters: nil)
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let defaultDTO = response.array()[0] as! PersonalAlarmDTO
            self.finish(defaultDTO)
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }
    
}
