//
//  WeatherDAO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 28/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class WeatherDAO: GenericDAO {
    
    func getForecasts(token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = ForecastDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: "services", statusCodes: nil)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "weather/services/\(_token)/",
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
    
    
    func getLocations(name _name: String!, token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = LocationDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: "zone", statusCodes: nil)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "weather/location/\(_name)/\(_token)/",
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
                self.finish(nil)
        })
        operation.start()
        
    }
    
    func getConditions(token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = ConditionDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: "conditions", statusCodes: nil)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "weather/conditions/\(_token)/",
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
    
    func setDefault(weatherDTO _weatherDTO: AlarmDTO!, token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = AlarmDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
    
        let place : String!
        if _weatherDTO!.place == nil{
            place = "place"
        }else{
            place = _weatherDTO!.place
        }
        
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "weather/set/default/\(_weatherDTO.condition!.intValue)/\(_weatherDTO.prediction!.intValue)/\(_weatherDTO.minTemp!.intValue)/\(_weatherDTO.maxTemp!.intValue)/\(_weatherDTO.minHumidity!.intValue)/\(_weatherDTO.maxHumidity!.intValue)/\(_weatherDTO.minWind!.intValue)/\(_weatherDTO.maxWind!.intValue)/\(_weatherDTO.minSnow!.intValue)/\(_weatherDTO.maxSnow!.intValue)/\(_weatherDTO.service!.intValue)/\(place)/\(_token)/",
            parameters: nil)
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let defaultDTO = response.array()[0] as! AlarmDTO
            self.finish(defaultDTO)
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }
    
    
    func getDefault(token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = AlarmDTO.mapping()
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "weather/data/\(_token)/",
            parameters: nil)
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let defaultDTO = response.array()[0] as! AlarmDTO
            self.finish(defaultDTO)
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }
    
}
