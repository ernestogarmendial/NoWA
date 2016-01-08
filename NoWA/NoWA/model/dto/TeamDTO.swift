//
//  TeamDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 8/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TeamDTO: GenericDTO {

    var teamID : NSNumber?
    var tournament : String?
    var stamp : String?
    var status : NSNumber?
    var name : String?
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: TeamDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "id": "teamID",
            "tournament": "tournament",
            "stamp": "stamp",
            "status": "status",
            "name": "name"
            
            ])
        
        return mapping
    }
    
}
