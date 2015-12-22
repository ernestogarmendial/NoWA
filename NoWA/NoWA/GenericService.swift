//
//  GenericService.swift
//  TICTAPPS
//
//  Created by Mariano D'Agostino on 5/13/15.
//  Copyright (c) 2015 TICTAPPS. All rights reserved.
//

import UIKit

class GenericService : NSObject, OperationSupport {
    
    var operations : NSMutableArray

    override init() {
        operations = NSMutableArray()
        super.init();
    }
    
    func addOperation(operation : Operation) {
        self.operations.addObject(operation)
    }
    
    func removeOperation(operation : Operation) {
        if(self.operations.containsObject(operation) != false){
            self.operations.removeObject(operation)
        }
    }
    
    func operationDidFinish(operation : Operation, result : AnyObject?) {
        
    }
    
    
    func callMessage(target _target : NSObject!, message _message : String!, withResult serviceResult: ServiceResult! ){
        NSThread.detachNewThreadSelector(Selector(_message), toTarget:_target, withObject: serviceResult);
    }
    
}