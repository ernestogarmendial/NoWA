//
//  UserDTO.swift
//  Encuestas
//
//  Created by Ernesto Garmendia on 5/27/15.
//  Copyright (c) 2015 WOP. All rights reserved.
//

import Foundation

class UserDTO: GenericDTO {
    var lastName: String?
    var stamp: String?
    var birth: String?
    var phone: String?
    var instagram: String?
    var id: NSNumber?
    var twitter: String?
    var username: String?
    var notifications: String?
    var token: String?
    var phrase: String?
    var name: String?
    var facebook: String?
    var dni: String?
    var code: String?
    
    func update(user: UserDTO) {
        
        if user.lastName != nil{
            self.lastName = user.lastName
        }
        if user.stamp != nil{
            self.stamp = user.stamp
        }
        if user.birth != nil{
            self.birth = user.birth
        }
        if user.phone != nil{
            self.phone = user.phone
        }
        if user.instagram != nil{
            self.instagram = user.instagram
        }
        if user.id != nil{
            self.id = user.id
        }
        if user.twitter != nil{
            self.twitter = user.twitter
        }
        if user.username != nil{
            self.username = user.username
        }
        if user.notifications != nil{
            self.notifications = user.notifications
        }
        if user.token != nil{
            self.token = user.token
        }
        if user.phrase != nil{
            self.phrase = user.phrase
        }
        if user.name != nil{
            self.name = user.name
        }
        if user.facebook != nil{
            self.facebook = user.facebook
        }
        if user.dni != nil{
            self.dni = user.dni
        }
        if user.code != nil{
            self.code = user.code
        }
    }
    
}
