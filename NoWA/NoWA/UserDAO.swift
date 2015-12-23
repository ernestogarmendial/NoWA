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
            "id": "id",
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
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "user/login/\(_name)/\(_code)/",
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
            "id": "id",
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
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "user/register/\(_name)/\(_code)/",
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
        
        let mapping = RKObjectMapping(forClass: UserDTO.self)
        mapping.addAttributeMappingsFromDictionary([
            "lastName": "lastName",
            "stamp": "stamp",
            "birth": "birth",
            "phone": "phone",
            "instagram": "instagram",
            "id": "id",
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
        
        let request = objectManager.requestWithObject(  nil,
            method: RKRequestMethod.GET,
            path: "user/recover/\(_name)/",
            parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let recoverCode = response.array()[0] as! String
            self.finish(recoverCode)
            },
            failure: { (operation, error) in
                self.finish(nil)
        })
        operation.start()
        
    }
    
//    func settings(token _token: String!, handler _handler : ((Operation,AnyObject)->Void)! ) {
//
//        completionHandler = _handler
//        
//        var objectManager = RKObjectManager(baseURL: NSURL(string: serverURL))
//        
//        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: RKMIMETypeJSON)
//        
//        var mapping = RKObjectMapping(forClass: UserDTO.self)
//        mapping.addAttributeMappingsFromDictionary([
//            "user.username":         "username",
//            "user.name":             "name"
//            ])
//        
//        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
//        
//        let request = objectManager.requestWithObject(  nil,
//                                                        method: RKRequestMethod.GET,
//                                                        path: "users/settings",
//                                                        parameters: nil)
//        
//        request.addValue("Content-Type", forHTTPHeaderField: "application/json")
//        request.addValue("Bearer \(_token)", forHTTPHeaderField: "Authorization")
//        request.addValue("2", forHTTPHeaderField: "trakt-api-version")
//        request.addValue("4a97af8e4a0e6ac71436943ccb165e26bf2d0f2c1a459eb68306d6cb9ff69d56", forHTTPHeaderField: "trakt-api-key")
//    
//        var operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
//        operation.setCompletionBlockWithSuccess({ (operation, response) in
//            var userDTO = response.array()[0] as! UserDTO
//            self.finish(userDTO)
//            },
//            failure: { (operation, error) in
//                self.finish(nil)
//        })
//        operation.start()
//        
//    }

}
