//
//  WeatherDTO.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 28/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class WeatherDTO: GenericDTO {

    var forecast: ForecastDTO?
    
    override class func mapping() -> RKObjectMapping! {
       
        let mapping = RKObjectMapping(forClass: WeatherDTO.self)
//        mapping.addAttributeMappingsFromDictionary([
//            "name" : "name",
//            ])
        
        let forecastMapping = ForecastDTO.mapping()
        
        let relationWeather = RKRelationshipMapping(fromKeyPath: "forecast", toKeyPath: "forecast", withMapping: forecastMapping)
        
        mapping.addPropertyMapping(relationWeather)
        
        return mapping
    }

    

}
