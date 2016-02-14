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
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "alarms/personal/\(_token)/",
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
    
    func getTournamentAlarms(token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = TournamentDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: "events", statusCodes: nil)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "alarms/tournament/\(_token)/",
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
            place = "place"
        }else{
            place = _alarmDTO!.place
        }
        
        let name : String!
        if _eventDTO.name == nil{
            name = "name"
        }else{
            name = _eventDTO.name
        }
        
        let description : String!
        if _eventDTO.eventDescription == nil{
            description = "description"
        }else{
            description = _eventDTO.eventDescription
        }
        
        let zone : String!
        if _eventDTO.eventZone == nil{
            zone = "zone"
        }else{
            zone = _eventDTO.eventZone
        }
        
        let repetition : String!
        if _eventDTO.repetition == nil{
            repetition = "repetition"
        }else{
            repetition = _eventDTO.repetition
        }
        
        let originalURL = "alarms/create/\(_dateTime)/\(name)/\(description)/\(zone)/\(repetition)/\(_alarmDTO.condition!.intValue)/\(_alarmDTO.prediction!.intValue)/\(_alarmDTO.minTemp!.intValue)/\(_alarmDTO.maxTemp!.intValue)/\(_alarmDTO.minHumidity!.intValue)/\(_alarmDTO.maxHumidity!.intValue)/\(_alarmDTO.minWind!.intValue)/\(_alarmDTO.maxWind!.intValue)/\(_alarmDTO.minSnow!.intValue)/\(_alarmDTO.maxSnow!.intValue)/\(_alarmDTO.service!.intValue)/\(place)/\(_token)/"
        
        let encodedURL = originalURL.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        print("escapedString: \(encodedURL!)")
        let url = encodedURL!.stringByReplacingOccurrencesOfString("%2F", withString: "/", options: NSStringCompareOptions.LiteralSearch, range: nil)
        print(url)
        
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
    
    func cancelAlarm(alarmID _alarmID : NSNumber!, value _value : NSNumber!,token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = PersonalAlarmDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "alarms/toggle/\(_alarmID)/\(_value)/\(_token)/",
            parameters: nil)
        
        print("alarms/toggle/\(_alarmID)/\(_value)/\(_token)/")
        
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
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "alarms/check/\(_alarmID)/\(_token)/",
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
            place = "place"
        }else{
            place = _alarmDTO!.place
        }
        
        let name : String!
        if _eventDTO.name == nil{
            name = "name"
        }else{
            name = _eventDTO.name
        }
        
        let description : String!
        if _eventDTO.eventDescription == nil{
            description = "description"
        }else{
            description = _eventDTO.eventDescription
        }
        
        let zone : String!
        if _eventDTO.eventZone == nil{
            zone = "zone"
        }else{
            zone = _eventDTO.eventZone
        }
        
        let repetition : String!
        if _eventDTO.repetition == nil{
            repetition = "repetition"
        }else{
            repetition = _eventDTO.repetition
        }
        
        print("alarms/update/\(_alarmDTO.alarmID)/\(_dateTime)/\(name)/\(description)/\(zone)/\(repetition)/\(_alarmDTO.condition!.intValue)/\(_alarmDTO.prediction!.intValue)/\(_alarmDTO.minTemp!.intValue)/\(_alarmDTO.maxTemp!.intValue)/\(_alarmDTO.minHumidity!.intValue)/\(_alarmDTO.maxHumidity!.intValue)/\(_alarmDTO.minWind!.intValue)/\(_alarmDTO.maxWind!.intValue)/\(_alarmDTO.minSnow!.intValue)/\(_alarmDTO.maxSnow!.intValue)/\(_alarmDTO.service!.intValue)/\(place)/\(_token)/")
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "alarms/update/\(_alarmDTO.alarmID)/\(_dateTime)/\(name)/\(description)/\(zone)/\(repetition)/\(_alarmDTO.condition!.intValue)/\(_alarmDTO.prediction!.intValue)/\(_alarmDTO.minTemp!.intValue)/\(_alarmDTO.maxTemp!.intValue)/\(_alarmDTO.minHumidity!.intValue)/\(_alarmDTO.maxHumidity!.intValue)/\(_alarmDTO.minWind!.intValue)/\(_alarmDTO.maxWind!.intValue)/\(_alarmDTO.minSnow!.intValue)/\(_alarmDTO.maxSnow!.intValue)/\(_alarmDTO.service!.intValue)/\(place)/\(_token)/",
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
