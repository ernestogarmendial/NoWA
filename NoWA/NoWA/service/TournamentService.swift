//
//  TournamentService.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 18/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TournamentService: GenericService {

    
    func getTournaments(token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let tournamentDAO: TournamentDAO = TournamentDAO()
        tournamentDAO.delegate = self
        tournamentDAO.getTournamentsAdmin( token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "TournamentsAdmin")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }

    
}
