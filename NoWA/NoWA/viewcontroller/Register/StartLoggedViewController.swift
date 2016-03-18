//
//  StartLoggedViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 14/2/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class StartLoggedViewController: LoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userService : UserService = UserService()
        
        let email = NSUserDefaults.standardUserDefaults().valueForKey("email") as? String
        let pass = NSUserDefaults.standardUserDefaults().valueForKey("pass") as? String
        
        if email != nil && pass != nil {
            userService.login(email, code: pass,target: self,message: "loginFinish:")
        }
        else {
            let registerVC = RegisterViewController()
            registerVC.loginFacebook()
        }
    }
    
    func loginFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error login")
            self.navigationController?.pushViewController(RegisterViewController(), animated: true)
            return
        }
        
        let usuarioLogueado:UserDTO = result.entityForKey("User") as! UserDTO
        if usuarioLogueado.token != nil {
            dispatch_async(dispatch_get_main_queue()) {
                self.startApp()
            }
            
        }
        
    }
}


