//
//  TournamentService.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 18/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TournamentService: GenericService {

    
    func getTournamentAlarms(token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let alarmDAO: AlarmDAO = AlarmDAO()
        alarmDAO.delegate = self
        alarmDAO.getTournamentAlarms( token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "TournamentAlarms")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }

    
}
