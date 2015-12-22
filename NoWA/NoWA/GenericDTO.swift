//
//  GenericDTO.swift
//  Encuestas
//
//  Created by Mariano D'Agostino on 5/27/15.
//  Copyright (c) 2015 WOP. All rights reserved.
//

import UIKit

@objc(GenericDTO) public class GenericDTO: NSObject {
   
    var errorTitle: String?
    var errorMessages: NSArray?
    
    //ObjC Properties
    var error: String?
    var errorDescription: String?
    
    class func mapping() -> RKObjectMapping! {
        return RKObjectMapping(forClass: GenericDTO.self)
    }
}
