//
//  GenericDAO.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

protocol Operation : AnyObject {
    func cancel();
    func resume();
}

protocol OperationSupport {
    func addOperation(operation : Operation);
    func removeOperation(operation : Operation);
    func operationDidFinish(operation : Operation, result : AnyObject?);
}

class GenericDAO  : NSObject, Operation {
    
//    let serverURL = "http://litebox.com.ar:8080/nowakeapp/api" ///"http://nowakeapp001.cloudapp.net:8080/nowakeapp/api"
   let serverURL = "http://192.168.1.104:8080/api/"
    
    var completionHandler:((Operation,AnyObject)->Void)!
    
    internal var closed : Bool = false;
    
    var delegate : OperationSupport?
    
    func cancel() {
        
    }
    
    func resume() {
        
    }
    
    internal func register() -> Bool{
        if(!closed){
            closed = true;
            self.delegate?.addOperation(self)
            return true;
        }
        return false;
    }

    internal func finish(result : AnyObject?){
        if result != nil {
            self.completionHandler(self,result!)
            self.delegate?.removeOperation(self)
            closed = false;
        }
    }
    
    func printResponse(operation : RKObjectRequestOperation){
        print(operation.HTTPRequestOperation.responseString)
    }
    
    func encodeURL(originalURL: String) -> String{
        
        let encodedURL = originalURL.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        print("escapedString: \(encodedURL!)")
        let url = encodedURL!.stringByReplacingOccurrencesOfString("%2F", withString: "/", options: NSStringCompareOptions.LiteralSearch, range: nil)
        print(url)
        return url
    }
}
