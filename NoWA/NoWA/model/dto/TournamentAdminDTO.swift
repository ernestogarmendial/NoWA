//
//  TournamentAdminDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 18/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TournamentAdminDTO: GenericDTO {
    
    var isSchool : NSNumber?
    var tournamentID : NSNumber?
    var stamp : String?
    var tournamentCategory : TournamentObjectDTO?
    var modalidad : TournamentObjectDTO?
    var status : NSNumber?
    var name : String?
    var sport : TournamentObjectDTO?
    var year : NSNumber?
    var tournamentType : TournamentObjectDTO?
    
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: TournamentAdminDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "isSchool" : "isSchool",
            "id" : "tournamentID",
            "stamp": "stamp",
//            "category" : "tournamentCategory",
            "modalidad": "modalidad",
            "status": "status",
            "name": "name",
//            "sport": "sport",
            "year": "year",
            "type": "tournamentType"

            
            ])
        
        let tournamentCategoryMapping = TournamentObjectDTO.mapping()
        let categoryRelation = RKRelationshipMapping(fromKeyPath: "category", toKeyPath: "tournamentCategory", withMapping: tournamentCategoryMapping)
        mapping.addPropertyMapping(categoryRelation)
        
        let sportMapping = TournamentObjectDTO.mapping()
        let sportRelation = RKRelationshipMapping(fromKeyPath: "sport", toKeyPath: "sport", withMapping: sportMapping)
        mapping.addPropertyMapping(sportRelation)
        
        return mapping
    }
    
}
