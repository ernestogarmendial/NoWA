//
//  PersonalAlarmDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 7/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PersonalAlarmDTO: GenericDTO {
    
    var event : NSMutableArray?//EventDTO?
    var weather : NSMutableArray?//AlarmDTO?
    var eventID : NSNumber?
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: PersonalAlarmDTO.self)
        
        let eventMapping = EventDTO.mapping()
        let eventRelation = RKRelationshipMapping(fromKeyPath: "event", toKeyPath: "event", withMapping: eventMapping)
        mapping.addPropertyMapping(eventRelation)
        
        let weatherMapping = AlarmDTO.mapping()
        let weatherRelation = RKRelationshipMapping(fromKeyPath: "weather", toKeyPath: "weather", withMapping: weatherMapping)
        mapping.addPropertyMapping(weatherRelation)
        
        return mapping
    }
    
}
