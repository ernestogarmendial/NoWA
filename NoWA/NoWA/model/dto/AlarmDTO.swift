//
//  AlarmDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 5/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AlarmDTO: GenericDTO {

    var service : NSNumber!
    var place : String?
    var condition : NSNumber!
    var prediction : NSNumber!
    var minTemp : NSNumber!
    var maxTemp : NSNumber!
    var minSnow : NSNumber!
    var maxSnow : NSNumber!
    var minWind : NSNumber!
    var maxWind : NSNumber!
    var minHumidity : NSNumber!
    var maxHumidity : NSNumber!
    var stamp : String?
    var alarmID : NSNumber?
    var status : NSNumber?
    var isDefault : NSNumber?
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: ConditionDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "stamp": "stamp",
            "status": "status",
            "condition": "condition",
            "maxWind": "maxWind",
            "prediction": "prediction",
            "minTemp": "minTemp",
            "minHumidity": "minHumidity",
            "id": "id",
            "maxTemp": "maxTemp",
            "minWind": "minWind",
            "isDefault": "isDefault",
            "service": "service",
            "maxHumidity": "maxHumidity",
            "minSnow": "minSnow",
            "maxSnow": "maxSnow",
            "place": "place"
            
            ])
        
        return mapping
    }
    
}
