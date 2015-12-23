//
//  FestMakerService.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit
//
//class FestMakerService: GenericService {
//    
//    func getMyMelodies(target _target : NSObject, message _message : String) {
//        
//        var serviceResult = ServiceResult()
//        
//        if !TTInternetConnection.sharedInstance().internetAccess() {
//            serviceResult.addError("No Internet")
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//            return
//        }
//        
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
//    }
//    
//    func getTopTen(target _target : NSObject, message _message : String) {
//        
//        var serviceResult = ServiceResult()
//        
//        if !TTInternetConnection.sharedInstance().internetAccess() {
//            serviceResult.addError("No Internet")
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//            return
//        }
//        
//        if(serviceResult.hasErrors()){
//            self.callMessage(target: _target, message: _message, withResult: serviceResult)
//            return
//        }
//        
//        var myMelodiesDAO: MyMelodiesDAO = MyMelodiesDAO()
//        myMelodiesDAO.delegate = self
//        myMelodiesDAO.getTopTen( handler: { (operation, result) in
//            var topTen : NSMutableArray = NSMutableArray()
//            topTen = result as! NSMutableArray
//            
//            if( topTen.count != 0 ){
//                serviceResult.addEntity(result, forKey: "topTen")
//            }
//            
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//        })
//    }
//    
//    func getRandom(target _target : NSObject, message _message : String) {
//        
//        var serviceResult = ServiceResult()
//        
//        if !TTInternetConnection.sharedInstance().internetAccess() {
//            serviceResult.addError("No Internet")
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//            return
//        }
//        
//        if(serviceResult.hasErrors()){
//            self.callMessage(target: _target, message: _message, withResult: serviceResult)
//            return
//        }
//        
//        var myMelodiesDAO: MyMelodiesDAO = MyMelodiesDAO()
//        myMelodiesDAO.delegate = self
//        myMelodiesDAO.getRandom( handler: { (operation, result) in
//            var random : NSMutableArray = NSMutableArray()
//            random = result as! NSMutableArray
//            
//            if( random.count != 0 ){
//                serviceResult.addEntity(result, forKey: "random")
//            }
//            
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//        })
//    }
//    
//    func addMelody(target _target : NSObject, message _message : String, musicSheet: NSMutableArray, titleCover:String, idCover:NSNumber) {
//        
//        var serviceResult = ServiceResult()
//        
//        if !TTInternetConnection.sharedInstance().internetAccess() {
//            serviceResult.addError("No Internet")
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//            return
//        }
//        
//        if(serviceResult.hasErrors()){
//            self.callMessage(target: _target, message: _message, withResult: serviceResult)
//            return
//        }
//        
////        if let user = PFUser.currentUser() {
////            let params = NSMutableDictionary()
////            
////            
////            var dataMelodySheet = NSJSONSerialization.dataWithJSONObject(musicSheet, options: NSJSONWritingOptions.allZeros, error: nil)
////            var stringMelody = NSString(data: dataMelodySheet!, encoding:NSUTF8StringEncoding)
////            
////            params.setObject( user.objectId!, forKey: "userID" )
////            params.setObject( idCover.stringValue, forKey: "cover" )
////            params.setObject( stringMelody!, forKey: "musicSheet" )
////            params.setObject( titleCover, forKey: "name" )
////            
////            PFCloud.callFunctionInBackground("addMelody", withParameters: params as [NSObject : AnyObject]) {
////                (response: AnyObject?, error: NSError?) -> Void in
////                
////                println("addMelody")
////                
////            }
////        }
//        
//        
//        var myMelodiesDAO: MyMelodiesDAO = MyMelodiesDAO()
//        myMelodiesDAO.delegate = self
//        myMelodiesDAO.addMelody( musicSheet, idCover: idCover, titleCover: titleCover,handler: { (operation, result) in
//            
//            
//            serviceResult.addEntity(result, forKey: "addMelody")
//            
//            
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//        })
//        
//    }
//    
//    func likeMelody(target _target : NSObject, message _message : String, melodyID: String) {
//        
//        var serviceResult = ServiceResult()
//        
//        if !TTInternetConnection.sharedInstance().internetAccess() {
//            serviceResult.addError("No Internet")
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//            return
//        }
//        
//        if(serviceResult.hasErrors()){
//            self.callMessage(target: _target, message: _message, withResult: serviceResult)
//            return
//        }
//        
////        if let user = PFUser.currentUser() {
////            let params = NSMutableDictionary()
////
////            params.setObject( user.objectId!, forKey: "userID" )
////            params.setObject( melodyID, forKey: "melodyID" )
////            
////            PFCloud.callFunctionInBackground("like", withParameters: params as [NSObject : AnyObject]) {
////                (response: AnyObject?, error: NSError?) -> Void in
////                
////                println("like")
////                
////            }
////        }
//        
//        
//        var myMelodiesDAO: MyMelodiesDAO = MyMelodiesDAO()
//        myMelodiesDAO.delegate = self
//        myMelodiesDAO.likeMelody( melodyID,handler: { (operation, result) in
//            
//            
//            serviceResult.addEntity(result, forKey: "like")
//            
//            
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//        })
//            
////        }
//        
//    }
//    
//    func dislikeMelody(target _target : NSObject, message _message : String, melodyID: String) {
//        
//        var serviceResult = ServiceResult()
//        
//        if !TTInternetConnection.sharedInstance().internetAccess() {
//            serviceResult.addError("No Internet")
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//            return
//        }
//        
//        if(serviceResult.hasErrors()){
//            self.callMessage(target: _target, message: _message, withResult: serviceResult)
//            return
//        }
//        
//        if let user = PFUser.currentUser() {
//            let params = NSMutableDictionary()
//            
//            params.setObject( user.objectId!, forKey: "userID" )
//            params.setObject( melodyID, forKey: "melodyID" )
//            
//            PFCloud.callFunctionInBackground("dislike", withParameters: params as [NSObject : AnyObject]) {
//                (response: AnyObject?, error: NSError?) -> Void in
//                
//                println("dislike")
//                
//            }
//        }
//        
//    }
//    
//    
//    
//    func deleteMelody(target _target : NSObject, message _message : String, melodyID: String) {
//        
//        var serviceResult = ServiceResult()
//        
//        if !TTInternetConnection.sharedInstance().internetAccess() {
//            serviceResult.addError("No Internet")
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//            return
//        }
//        
//        if(serviceResult.hasErrors()){
//            self.callMessage(target: _target, message: _message, withResult: serviceResult)
//            return
//        }
//        
//        var myMelodiesDAO: MyMelodiesDAO = MyMelodiesDAO()
//        myMelodiesDAO.delegate = self
//        myMelodiesDAO.deleteMelody( melodyID,handler: { (operation, result) in
//            
//            
//            serviceResult.addEntity(result, forKey: "delete")
//            
//            
//            NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult)
//        })
//        
//    }
//
//}
