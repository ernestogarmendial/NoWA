//
//  PersonalAlarmDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 7/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PersonalAlarmDTO: GenericDTO {

    var event : EventDTO?
    var weather : AlarmDTO?
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: PersonalAlarmDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "event" : "event",
            "weather" : "weather"
            
            ])
        
        return mapping
    }
    
}
