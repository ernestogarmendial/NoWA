//
//  TournamentDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 8/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TournamentDTO: GenericDTO {

    var tournamentID : NSNumber?
    var teams : NSMutableArray?
    var stamp : String?
    var status : NSNumber?
    var tournamentDescription : String?
    var name : String?
    var eventZone : String?
    var repetition : String?
    var cancelSelected : Bool?
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: TournamentDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "id" : "tournamentID",
            "stamp": "stamp",
            "status": "status",
            "description": "tournamentDescription",
            "name": "name",
            "zone": "eventZone",
            "repetition": "repetition"
            
            ])
        
        let teamMapping = TeamDTO.mapping()
        
        let relation = RKRelationshipMapping(fromKeyPath: "teams", toKeyPath: "teams", withMapping: teamMapping)
        mapping.addPropertyMapping(relation)
        
        return mapping
    }
    
}
