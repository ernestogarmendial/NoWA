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
                if let accessToken = UserService.currentUser.access_token {
                    //
                    serviceResult.addEntity(UserService.currentUser, forKey: "User")
                    
                    self.callMessage(target: _target, message: _message, withResult: serviceResult)
                }
            }
        })
    }
}

