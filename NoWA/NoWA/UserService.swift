//
//  UserService.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class UserService: GenericService {
    
    static var currentUser: UserDTO!
    
    func login(name : String?, code :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let md5code = md5(string: code!)
        
        let userDAO: UserDAO = UserDAO()
        userDAO.delegate = self
        userDAO.login( name: name, code: md5code, handler: { (operation, result) in
            let user = result as? UserDTO;
            
            if(user == nil || (user != nil && user!.errorTitle != nil)){
                serviceResult.addError("error")
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }else{
                
                UserService.currentUser = result as! UserDTO;
                //
                if let accessToken = UserService.currentUser.token {
                    //
                    serviceResult.addEntity(UserService.currentUser, forKey: "User")
                    
                    self.callMessage(target: _target, message: _message, withResult: serviceResult)
                }
            }
        })
    }
    
    
    func loginFacebook(username: NSString!, email: NSString!, fbID : NSString!, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let md5code = md5(string: fbID! as String)
        
        let userDAO: UserDAO = UserDAO()
        userDAO.delegate = self
        userDAO.loginFacebook(username, email: email, fbID : md5code, handler: { (operation, result) in
            let user = result as? UserDTO;
            
            if(user == nil || (user != nil && user!.errorTitle != nil)){
                serviceResult.addError("error")
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }else{
                
                UserService.currentUser = result as! UserDTO;
                //
                if let accessToken = UserService.currentUser.token {
                    //
                    serviceResult.addEntity(UserService.currentUser, forKey: "UserFB")
                    
                    self.callMessage(target: _target, message: _message, withResult: serviceResult)
                }
            }
        })
    }
    
    
    func update(updateDTO : UserDTO, token: String, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        
        let userDAO: UserDAO = UserDAO()
        userDAO.delegate = self
        userDAO.update(updateDTO, token: UserService.currentUser.token!, handler: { (operation, result) in
            let user = result as? UserDTO;
            
            if(user == nil || (user != nil && user!.errorTitle != nil)){
                serviceResult.addError("error")
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }else{
                
                UserService.currentUser = result as! UserDTO;
                //
                if let accessToken = UserService.currentUser.token {
                    //
                    serviceResult.addEntity(UserService.currentUser, forKey: "Update")
                    
                    self.callMessage(target: _target, message: _message, withResult: serviceResult)
                }
            }
        })
    }
    
    func register(name : String?, code :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let md5code = md5(string: code!)
        
        let userDAO: UserDAO = UserDAO()
        userDAO.delegate = self
        userDAO.register( name: name, code: md5code, handler: { (operation, result) in
            let user = result as? UserDTO;
            
            if(user == nil || (user != nil && user!.errorTitle != nil)){
//                serviceResult.addErrorsFromDTO(user!)
//                self.callMessage(target: _target, message: _message, withResult: serviceResult)
                let error = result as! NSError
                let errorString = String(error.code)
                serviceResult.addError(errorString)
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }else{
                if(result as! NSObject == []){
                    serviceResult.addError("error")
                    self.callMessage(target: _target, message: _message, withResult: serviceResult)
                }
                
                UserService.currentUser = result as! UserDTO;
                //
                if let _ = UserService.currentUser.token {
                    //
                    serviceResult.addEntity(UserService.currentUser, forKey: "RegisterUser")
                    
                    self.callMessage(target: _target, message: _message, withResult: serviceResult)
                }
            }
        })
    }
    
    func recover(name : String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let userDAO: UserDAO = UserDAO()
        userDAO.delegate = self
        userDAO.recover( name: name, handler: { (operation, result) in
            let recoverDTO = result as? RecoverDTO
            
            if(recoverDTO!.code == nil){
                serviceResult.addErrorsFromDTO(recoverDTO!)
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }else{
                serviceResult.addEntity(recoverDTO, forKey: "RecoverCode")
                
                self.callMessage(target: _target, message: _message, withResult: serviceResult)
            }
        })
    }
}



func md5(string string: String) -> String {
    var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
    if let data = string.dataUsingEncoding(NSUTF8StringEncoding) {
        CC_MD5(data.bytes, CC_LONG(data.length), &digest)
    }
    
    var digestHex = ""
    for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
        digestHex += String(format: "%02x", digest[index])
    }
    
    return digestHex
}



