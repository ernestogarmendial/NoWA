//
//  UserService.swift
//  TICTAPPS
//
//  Created by Mariano D'Agostino on 5/25/15.
//  Copyright (c) 2015 TICTAPPS. All rights reserved.
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
        
        let userDAO: UserDAO = UserDAO()
        userDAO.delegate = self
        userDAO.login( name: name, code: code, handler: { (operation, result) in
            let user = result as? UserDTO;
            
            if(user == nil || (user != nil && user!.errorTitle != nil)){
                serviceResult.addErrorsFromDTO(user!)
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
    
//    func md5(string string: String) -> String {
//        var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
//        if let data = string.dataUsingEncoding(NSUTF8StringEncoding) {
//            CC_MD5(data.bytes, CC_LONG(data.length), &digest)
//        }
//        
//        var digestHex = ""
//        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
//            digestHex += String(format: "%02x", digest[index])
//        }
//        
//        return digestHex
//    }
    
}

