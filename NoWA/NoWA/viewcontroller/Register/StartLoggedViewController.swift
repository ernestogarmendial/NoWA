//
//  StartLoggedViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 14/2/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class StartLoggedViewController: LoginViewController {
    
    var splash : UIImageView?
    var progressIcon = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userService : UserService = UserService()
        
        let email = NSUserDefaults.standardUserDefaults().valueForKey("email") as? String
        let pass = NSUserDefaults.standardUserDefaults().valueForKey("pass") as? String
        
        splash = UIImageView(image: (UIImage(named: "splash")))
        self.view.addSubview(splash!)
        
        progressIcon.startAnimating()
        self.view.addSubview(progressIcon)
        
        splash?.autoPinEdge(.Top, toEdge: .Top, ofView: self.view)
        splash?.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self.view)
        splash?.autoPinEdge(.Left, toEdge: .Left, ofView: self.view)
        splash?.autoPinEdge(.Right, toEdge: .Right, ofView: self.view)
        
        progressIcon.autoAlignAxis(.Vertical, toSameAxisOfView: self.view)
        progressIcon.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self.view, withOffset: -120)



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


