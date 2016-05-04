//
//  EventDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 7/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class EventDTO: GenericDTO {
    
    var eventID : NSNumber?
    var stamp : String?
    var status : NSNumber?
    var eventDescription : String?
    var name : String?
    var eventZone : String?
    var repetition : String?
    var useDefault : NSNumber?

    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: EventDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "id" : "eventID",
            "stamp": "stamp",
            "status": "status",
            "description": "eventDescription",
            "name": "name",
            "zone": "eventZone",
            "useDefault": "useDefault",
            "repetition": "repetition"
            
            ])
        
        return mapping
    }
    
}
