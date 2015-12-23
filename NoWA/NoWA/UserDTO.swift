//
//  UserDTO.swift
//  Encuestas
//
//  Created by Mariano D'Agostino on 5/27/15.
//  Copyright (c) 2015 WOP. All rights reserved.
//

import Foundation

@objc(UserDTO) class UserDTO: GenericDTO {
    var userID : String?
    var name : String?
    var username : String?
    var email : String?
    var nick : String?
    var token : String?
    var photoURL : String?
    var active : NSMutableArray?
    var opponentTurn : NSMutableArray?
    var unapproved : NSMutableArray?
    var ended : NSMutableArray?
    var access_token: NSString?
    var token_type: NSString?
    var expires_in: NSNumber?
    var refresh_token: NSString?
    var error_description: NSString?
    
    func update(user: UserDTO) {
        
        if user.username != nil{
            self.username = user.username
        }
        if user.name != nil{
            self.name = user.name
        }
        if user.username != nil{
            self.username = user.username
        }
        if user.email != nil{
            self.email = user.email
        }
        if user.nick != nil{
            self.nick = user.nick
        }
        if user.token != nil{
            self.token = user.token
        }
        if user.photoURL != nil{
            self.photoURL = user.photoURL
        }
        if user.active != nil{
            self.active = user.active
        }
        if user.opponentTurn != nil{
            self.opponentTurn = user.opponentTurn
        }
        if user.unapproved != nil{
            self.unapproved = user.unapproved
        }
        if user.ended != nil{
            self.ended = user.ended
        }
        if user.access_token != nil{
            self.access_token = user.access_token
        }
        if user.token_type != nil{
            self.token_type = user.token_type
        }
        if user.expires_in != nil{
            self.expires_in = user.expires_in
        }
        if user.refresh_token != nil{
            self.refresh_token = user.refresh_token
        }
        if user.error != nil{
            self.error = user.error
        }
        if user.error_description != nil{
            self.error_description = user.description
        }
    }
    
}
