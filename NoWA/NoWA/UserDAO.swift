//
//  UserDAO.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class UserDAO: GenericDAO {
   
    func login(name _name: String!, code _code: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = RKObjectMapping(forClass: UserDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            "lastName": "lastName",
            "stamp": "stamp",
            "birth": "birth",
            "phone": "phone",
            "instagram": "instagram",
            "id": "userid",
            "twitter": "twitter",
            "username": "username",
            "notifications": "notifications",
            "token": "token",
            "phrase": "phrase",
            "name": "name",
            "facebook": "facebook",
            "dni": "dni"
            ])
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let deviceToken = NSUserDefaults.standardUserDefaults().valueForKey("deviceToken") as! String
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "user/login/\(_name)/\(_code)/ios/\(deviceToken)/",
            parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let userDTO = response.array()[0] as! UserDTO
            self.finish(userDTO)
            },
            failure: { (operation, error) in
                self.finish(error)
        })
        operation.start()

    }

    func register(name _name: String!, code _code: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = RKObjectMapping(forClass: UserDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            "lastName": "lastName",
            "stamp": "stamp",
            "birth": "birth",
            "phone": "phone",
            "instagram": "instagram",
            "id": "userid",
            "twitter": "twitter",
            "username": "username",
            "notifications": "notifications",
            "token": "token",
            "phrase": "phrase",
            "name": "name",
            "facebook": "facebook",
            "dni": "dni"
            ])
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let deviceToken = NSUserDefaults.standardUserDefaults().valueForKey("deviceToken") as! String

        print ("user/register/\(_name)/\(_code)/ios/\(deviceToken)/")
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "user/register/\(_name)/\(_code)/ios/\(deviceToken)/",
            parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let userDTO = response.array()[0] as! UserDTO
            self.finish(userDTO)
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }

    func recover(name _name: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
        if(!self.register()){
            return;
        }
        
        completionHandler = _handler
        
        let objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
        
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "application/json")
        
        let mapping = RKObjectMapping(forClass: RecoverDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            "code": "code"
            ])
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "user/recover/\(_name)/",
            parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let recoverDTO = response.array()[0] as! RecoverDTO
            self.finish(recoverDTO)
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }


}
