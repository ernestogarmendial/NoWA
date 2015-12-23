//
//  MyMelodiesDAO.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class MyMelodiesDAO: GenericDAO {
//    
//    func getMyMelodies ( handler _handler : ((Operation,AnyObject)->Void)! ) {
//        
//        if(!self.register()){
//            return;
//        }
//        
//        completionHandler = _handler
//        
//        if let user = PFUser.currentUser() {
//            let params = NSMutableDictionary()
//            params.setObject( user.objectId!, forKey: "userID" )
//            
//            PFCloud.callFunctionInBackground("melodiesFromUser", withParameters: params as [NSObject : AnyObject]) {
//                (response: AnyObject?, error: NSError?) -> Void in
//                
//                var myMelodies = NSMutableArray()
//                
//                if let melodies = response as? NSArray{
//                    for melody in melodies{
//                        
//                        var myMelodyDTO = MyMelodyDTO()
//                        myMelodyDTO.objectId = melody.objectId
//                        myMelodyDTO.cover = melody.valueForKey("cover") as? String
//                        myMelodyDTO.musicSheet = melody.valueForKey("musicSheet") as? String
//                        myMelodyDTO.user = melody.valueForKey("user") as? PFUser
//                        myMelodyDTO.votes = melody.valueForKey("votes") as? NSInteger
//                        myMelodyDTO.name = melody.valueForKey("name") as? String
//                        myMelodyDTO.position = melody.valueForKey("position") as? NSInteger
//                        myMelodies.addObject(myMelodyDTO)
//                    }
//                    
//                }
//                self.finish(myMelodies)
//            }
//        }
//    }
//    
//    func getTopTen ( handler _handler : ((Operation,AnyObject)->Void)! ) {
//        
//        if(!self.register()){
//            return;
//        }
//        
//        completionHandler = _handler
//        println("topTen")
//        
//        if let user = PFUser.currentUser() {
//            
//            PFCloud.callFunctionInBackground("topTen", withParameters: nil){
//                (response: AnyObject?, error: NSError?) -> Void in
//                
//                var topTenResult = NSMutableArray()
//                
//                if let topTenArray = response as? NSArray{
//                    for topTenItem in topTenArray{
//                        
//                        var topTenDTO = MyMelodyDTO()
//                        topTenDTO.objectId = topTenItem.objectId
//                        topTenDTO.cover = topTenItem.valueForKey("cover") as? String
//                        topTenDTO.musicSheet = topTenItem.valueForKey("musicSheet") as? String
//                        topTenDTO.user = topTenItem.valueForKey("user") as? PFUser
//                        topTenDTO.votes = topTenItem.valueForKey("votes") as? NSInteger
//                        topTenDTO.name = topTenItem.valueForKey("name") as? String
//                        topTenDTO.creator = topTenItem.valueForKey("creator") as? String
//                        topTenDTO.position = topTenItem.valueForKey("position") as? NSInteger
//                        topTenResult.addObject(topTenDTO)
//                    }
//                    
//                }
//                self.finish(topTenResult)
//                
//                println("topTen")
//            }
//        }
//    }
//    
//    func getRandom ( handler _handler : ((Operation,AnyObject)->Void)! ) {
//        
//        if(!self.register()){
//            return;
//        }
//        
//        completionHandler = _handler
//        println("random")
//        
//        if let user = PFUser.currentUser() {
//            
//            PFCloud.callFunctionInBackground("random", withParameters: nil){
//                (response: AnyObject?, error: NSError?) -> Void in
//                
//                var randomResult = NSMutableArray()
//                
//                if let randomArray = response as? NSArray{
//                    for randomItem in randomArray{
//                        
//                        var randomDTO = MyMelodyDTO()
//                        randomDTO.objectId = randomItem.objectId
//                        randomDTO.cover = randomItem.valueForKey("cover") as? String
//                        randomDTO.musicSheet = randomItem.valueForKey("musicSheet") as? String
//                        randomDTO.user = randomItem.valueForKey("user") as? PFUser
//                        randomDTO.votes = randomItem.valueForKey("votes") as? NSInteger
//                        randomDTO.name = randomItem.valueForKey("name") as? String
//                        randomDTO.creator = randomItem.valueForKey("creator") as? String
//                        randomDTO.position = randomItem.valueForKey("position") as? NSInteger
//                        
//                        randomResult.addObject(randomDTO)
//                    }
//                    
//                }
//                self.finish(randomResult)
//            }
//        }
//    }
//    
//    
//    
//    func deleteMelody (melodyID:String ,handler _handler : ((Operation,AnyObject)->Void)! ) {
//        
//        if(!self.register()){
//            return;
//        }
//        
//        completionHandler = _handler
//        
//        println("random")
//        
//        if let user = PFUser.currentUser() {
//            
//            let params = NSMutableDictionary()
//            params.setObject(melodyID, forKey: "melodyID")
//            
//            PFCloud.callFunctionInBackground("delete", withParameters: params as [NSObject : AnyObject]){
//                (response: AnyObject?, error: NSError?) -> Void in
//                
//                let respuesta = response as? String
//                
//                self.finish(respuesta)
//                
//            }
//        }
//    }
//    
//    
//    
//    
//    func likeMelody (melodyID:String ,handler _handler : ((Operation,AnyObject)->Void)! ) {
//        
//        if(!self.register()){
//            return;
//        }
//        
//        completionHandler = _handler
//        
//        println("random")
//        
//        if let user = PFUser.currentUser() {
//            
//            let params = NSMutableDictionary()
//            params.setObject(melodyID, forKey: "melodyID")
//            params.setObject( user.objectId!, forKey: "userID" )
//            
//            PFCloud.callFunctionInBackground("like", withParameters: params as [NSObject : AnyObject]){
//                (response: AnyObject?, error: NSError?) -> Void in
//                
//                let respuesta = response as? String
//                
//                self.finish(respuesta)
//                
//            }
//        }
//    }
//    
//    
//    
//    
//    
//    
//    
//    //    musicSheet, idCover, titleCover
//    
//    func addMelody (musicSheet:NSMutableArray , idCover:NSNumber, titleCover: String, handler _handler : ((Operation,AnyObject)->Void)! ) {
//        
//        if(!self.register()){
//            return;
//        }
//        
//        completionHandler = _handler
//        
//        println("random")
//        
//        if let user = PFUser.currentUser() {
//            
//            
//            var dataMelodySheet = NSJSONSerialization.dataWithJSONObject(musicSheet, options: NSJSONWritingOptions.allZeros, error: nil)
//            var stringMelody = NSString(data: dataMelodySheet!, encoding:NSUTF8StringEncoding)
//            
//            let params = NSMutableDictionary()
//            params.setObject( user.objectId!, forKey: "userID" )
//            params.setObject( idCover.stringValue, forKey: "cover" )
//            params.setObject( stringMelody!, forKey: "musicSheet" )
//            params.setObject( titleCover, forKey: "name" )
//            
//            PFCloud.callFunctionInBackground("addMelody", withParameters: params as [NSObject : AnyObject]){
//                (response: AnyObject?, error: NSError?) -> Void in
//                
//                //                let respuesta = response as? MyMelodyDTO
//                
//                self.finish("test")
//                
//            }
//        }
//    }
    
}
