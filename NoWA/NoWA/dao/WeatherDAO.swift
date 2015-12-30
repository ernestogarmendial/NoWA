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

        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: "FORECASTIO", statusCodes: nil)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "weather/services/0a8dae93572ebce60fdb73014d7728be/",
            parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
//            let array = response.array() as NSArray
            let forecastDTO = response.firstObject as? ForecastDTO
            self.finish(forecastDTO)
//            self.finish(response.array())

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
//            let weatherDTO = response.array()[0] as! LocationDTO
//            self.finish(weatherDTO)
            let array = response.array() as NSArray
            self.finish(array)
//            self.finish(response.array())
            
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }
    
}
