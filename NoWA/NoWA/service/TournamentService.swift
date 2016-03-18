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
        tournamentDAO.getTournamentsListAdmin( token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "TournamentsAdmin")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    func editTournaments(dateTime _dateTime : String, alarmID _alarmID: NSNumber, token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let tournamentDAO: TournamentDAO = TournamentDAO()
        tournamentDAO.delegate = self
        tournamentDAO.editTournament(dateTime: _dateTime, alarmID: _alarmID, token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "EditTournament")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
    func cancelTournament(alarmID _alarmID : NSNumber, value _value : NSNumber, token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let tournamentDAO: TournamentDAO = TournamentDAO()
        tournamentDAO.delegate = self
        tournamentDAO.cancelTournament(alarmID: _alarmID, value: _value, token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "CancelAlarm")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }

    
    func getTournamentsEvents(tournamentID _tournamentID : NSNumber?,token _token :String?, target _target : NSObject, message _message : String ) {
        
        let serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            return
        }
        
        let tournamentDAO: TournamentDAO = TournamentDAO()
        tournamentDAO.delegate = self
        tournamentDAO.getTournamentsEvents(tournamentID: _tournamentID, token: _token, handler: { (operation, result) in
            
            serviceResult.addEntity(result, forKey: "TournamentEvents")
            
            self.callMessage(target: _target, message: _message, withResult: serviceResult)
            
        })
    }
    
}
