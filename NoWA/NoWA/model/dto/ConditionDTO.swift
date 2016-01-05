//
//  ConditionDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 4/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ConditionDTO: GenericDTO {

    var conditionID : NSNumber?
    var name : String?
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: ConditionDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "id" : "conditionID",
            "name" : "name",
            
            ])
        
        return mapping
    }
    
}
