//
//  LoginService.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 22/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class LoginService: GenericService {
    
    func login(target _target : NSObject, message _message : String) {
        
        var serviceResult = ServiceResult()
        
        if !TTInternetConnection.sharedInstance().internetAccess() {
            serviceResult.addError("No Internet")
            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
            return
        }
        
        //        if(serviceResult.hasErrors()){
        //            self.callMessage(target: _target, message: _message, withResult: serviceResult)
        //            return
        //        }
        //
        //        var myMelodiesDAO: MyMelodiesDAO = MyMelodiesDAO()
        //        myMelodiesDAO.delegate = self
        //        myMelodiesDAO.getMyMelodies( handler: { (operation, result) in
        //            var myMelodies : NSMutableArray = NSMutableArray()
        //            myMelodies = result as! NSMutableArray
        //
        //            if( myMelodies.count != 0 ){
        //                serviceResult.addEntity(result, forKey: "myMelodies")
        //            }
        //
        //            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
        //        })
    }
    
}
