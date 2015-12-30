//
//  ForecastDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 29/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ForecastDTO: GenericDTO {
    
    var forecastID : NSNumber?
    var name : String?
    
    override class func mapping() -> RKObjectMapping {
        
        let mapping = RKObjectMapping(forClass: ForecastDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            
            "id" : "forecastID",
            "name" : "name",
            
            ])
        
        return mapping
    }
    
}
