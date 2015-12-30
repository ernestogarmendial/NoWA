//
//  LocationDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/30/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class LocationDTO: GenericDTO {
    
    var locationId : NSNumber?
    var stamp : NSString?
    var status : NSNumber?
    var name : NSString?
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: LocationDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "id" : "locationId",
            "stamp" : "stamp",
            "status" : "status",
            "name" : "name",
            
            ])
        
        return mapping
    }
    
    
}
