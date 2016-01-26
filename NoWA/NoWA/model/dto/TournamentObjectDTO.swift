//
//  TournamentObjectDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 25/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TournamentObjectDTO: GenericDTO {

    var objectID : NSNumber?
    var stamp : String?
    var status : NSNumber?
    var name : String?
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: TournamentObjectDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "id" : "objectID",
            "stamp" : "stamp",
            "status" : "status",
            "name" : "name"
            ])
        
        return mapping
    }
    
}
