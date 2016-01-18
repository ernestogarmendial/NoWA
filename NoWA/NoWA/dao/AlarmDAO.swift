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
    
    
    func createAlarm(eventDTO _eventDTO : EventDTO, alarmDTO _alarmDTO: AlarmDTO!, token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
//        if(!self.register()){
//            return;
//        }
//        
//        completionHandler = _handler
//        
//        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
//        
//        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
//        
//        let mapping = AlarmDTO.mapping()
//        
//        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
//        
//        let place : String!
//        if _weatherDTO!.place == nil{
//            place = "place"
//        }else{
//            place = _weatherDTO!.place
//        }
//        
//        
//        let request = objectManager.requestWithObject(  nil,
//            method: RKRequestMethod.GET,
//            path: "weather/set/default/\(_weatherDTO.condition!.intValue)/\(_weatherDTO.prediction!.intValue)/\(_weatherDTO.minTemp!.intValue)/\(_weatherDTO.maxTemp!.intValue)/\(_weatherDTO.minHumidity!.intValue)/\(_weatherDTO.maxHumidity!.intValue)/\(_weatherDTO.minWind!.intValue)/\(_weatherDTO.maxWind!.intValue)/\(_weatherDTO.minSnow!.intValue)/\(_weatherDTO.maxSnow!.intValue)/\(_weatherDTO.service!.intValue)/\(place)/\(_token)/",
//            parameters: nil)
//        
//        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
//        operation.setCompletionBlockWithSuccess({ (operation, response) in
//            let defaultDTO = response.array()[0] as! AlarmDTO
//            self.finish(defaultDTO)
//            },
//            failure: { (operation, error) in
//                self.finish(nil)
//        })
//        operation.start()
        
    }
    
    func cancelAlarm(alarmID _alarmID : NSNumber!,token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
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
            path: "alarms/cancel/\(_alarmID)/\(_token)/",
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

}
