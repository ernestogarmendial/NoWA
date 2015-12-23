//
//  GenericDAO.swift
//  TICTAPPS
//
//  Created by Mariano D'Agostino on 5/13/15.
//  Copyright (c) 2015 TICTAPPS. All rights reserved.
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
    
    let serverURL = "http://nowakeapp001.cloudapp.net:8080/nowakeup/api"
   
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
    
}
