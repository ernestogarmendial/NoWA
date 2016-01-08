//
//  ServiceResult.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

@objc(ServiceResult) public class ServiceResult: NSObject {

    private var messages : NSMutableArray?
    
    private var errors : NSMutableArray?
    
    private var entities : NSMutableDictionary?
    
    override init() {
        super.init()
        
        self.messages = NSMutableArray()

        self.errors = NSMutableArray()
        
        self.entities = NSMutableDictionary();

    }
    
    public func hasErrors() -> Bool {
        return (self.errors?.count > 0);
    }
    
    public func hasMessages() -> Bool {
        return (self.messages?.count > 0);
    }
    
    public func addEntity( entity : AnyObject!, forKey key: String! ) {
        self.entities?.setObject(entity, forKey: key)
    }
    
    public func entityForKey( key : String ) -> AnyObject? {
        return self.entities?.objectForKey(key);
    }
    
    public func addError( error: String! ) {
        self.errors?.addObject(error)
    }
    
    public func addMessage( error: String! ) {
        self.messages?.addObject(error)
    }

    public func addErrorsFromDTO( dto : GenericDTO) {
        if (dto.errorMessages?.count > 0){
            for errorText in dto.errorMessages as! [String] {
                self.addError(errorText)
            }
        }
    }
    
    public func errorsString () -> String {
        let string = NSMutableString();
        for errorText in self.errors! {
            string.appendString("\(errorText)\n")
        }
        return string as String
    }
}
