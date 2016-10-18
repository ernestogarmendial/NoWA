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
            "role": "role",
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
        
        let lang =  NSLocale.preferredLanguages().first! as NSString
        let language = lang.substringWithRange(NSRange(location: 0, length: 2))
        
        let originalURL = "user/login/v2/\(language.uppercaseString)/\(_name)/\(_code)/ios/\(deviceToken)/"
        
        let url = self.encodeURL(originalURL)
        
        let request = objectManager.requestWithObject(  nil,
                                                        method: RKRequestMethod.GET,
                                                        path: url,
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
    
    func loginFacebook(username: NSString!, email: NSString!, fbID : NSString!, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
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
            "role": "role",
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
        
//        /user/facebook/v2/{language}/{mail}/{name}/{facebookhash}/{os}/{devicetoken}/
        let originalURL = "user/facebook/\(email)/\(username)/\(fbID)/ios/\(deviceToken)/"
        
        let url = self.encodeURL(originalURL)
        
        let request = objectManager.requestWithObject(  nil,
                                                        method: RKRequestMethod.GET,
                                                        path: url,
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
    
    func update(updateDTO : UserDTO, token: String, handler _handler : ((Operation,AnyObject)->Void)! ) {
        
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
            "role": "role",
            "twitter": "twitter",
            "username": "username",
            "notifications": "notifications",
            "token": "token",
            "phrase": "phrase",
            "name": "name",
            "facebook": "facebook",
            "dni": "dni"
            ])
        
        if updateDTO.username != nil{
            if updateDTO.username == ""{
                updateDTO.username = "-"
            }
        }
        if updateDTO.phrase != nil{
            if updateDTO.phrase == ""{
                updateDTO.phrase = "-"
            }
        }
        if updateDTO.facebook != nil{
            if updateDTO.facebook == ""{
                updateDTO.facebook = "-"
            }
        }
        if updateDTO.twitter != nil{
            if updateDTO.twitter == ""{
                updateDTO.twitter = "-"
            }
        }
        if updateDTO.instagram != nil{
            if updateDTO.instagram == ""{
                updateDTO.instagram = "-"
            }
        }
        
        let responseDescriptor : RKResponseDescriptor = RKResponseDescriptor(mapping: mapping, method: RKRequestMethod.GET, pathPattern: nil, keyPath: nil, statusCodes: nil)
        
        let deviceToken = NSUserDefaults.standardUserDefaults().valueForKey("deviceToken") as! String
        
        //        /name/quote/facebook/twitter/instagram/location/notification/token/
        let originalURL = "user/update/\(updateDTO.username!)/\(updateDTO.phrase!)/\(updateDTO.facebook!)/\(updateDTO.twitter!)/\(updateDTO.instagram!)/1/1/\(token)/"
        
        let url = self.encodeURL(originalURL)
        
        let request = objectManager.requestWithObject(  nil,
                                                        method: RKRequestMethod.GET,
                                                        path: url,
                                                        parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            let userDTO = response.array()[0] as! UserDTO
            self.finish(userDTO)
            },
                                                failure: { (operation, error) in
                                                    self.printResponse(operation)
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
            "role": "role",
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
        
        let originalURL = "user/register/\(_name)/\(_code)/ios/\(deviceToken)/"
        
        let url = self.encodeURL(originalURL)
        
        let request = objectManager.requestWithObject(  nil,
                                                        method: RKRequestMethod.GET,
                                                        path: url,
                                                        parameters: nil)
        
        
        let operation : RKObjectRequestOperation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
        operation.setCompletionBlockWithSuccess({ (operation, response) in
            if response != nil{
                let userDTO = response.array()[0] as! UserDTO
                self.finish(userDTO)
            }else{
                self.finish([])
            }
            },
                                                failure: { (operation, error) in
                                                    self.printResponse(operation)
                                                    self.finish(error)
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
        
        let originalURL = "user/recover/\(_name)/"
        
        let url = self.encodeURL(originalURL)
        
        
        let request = objectManager.requestWithObject(  nil,
                                                        method: RKRequestMethod.GET,
                                                        path: url,
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
    
    
    func logout(handler _handler : ((Operation,AnyObject)->Void)! ) {
        
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
            "role": "role",
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
        

        let originalURL = "user/logout/\(UserService.currentUser.token!)/"
        
        let url = self.encodeURL(originalURL)
        
        
        let request = objectManager.requestWithObject(  nil,
                                                        method: RKRequestMethod.GET,
                                                        path: url,
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
    
}
