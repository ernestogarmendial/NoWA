//
//  RegisterViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/1/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

class RegisterViewController: UIViewController {
    
    var emailView : RegisterFieldView!
    var passwordView : RegisterFieldView!

    var aceptTermsButton : UIButton!
    var aceptTermsLabel : UILabel!
    var ingresarButton : UIButton!
    var ingresarFacebookButton : UIButton!
    var createAccountButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .redColor()
        
        emailView = RegisterFieldView()
        emailView.backgroundColor = .grayColor()
        emailView.setItems(nil,placeholder: "TU CORREO", recover: false)
        self.view.addSubview(emailView)
        
        passwordView = RegisterFieldView()
        passwordView.backgroundColor = .orangeColor()
        passwordView.setItems(nil,placeholder: "CONTRASENIA", recover: true)
        self.view.addSubview(passwordView)
        
        ingresarButton = UIButton()
        ingresarButton.backgroundColor = .blueColor()
        ingresarButton.setTitle("INGRESAR", forState: UIControlState.Normal)
        ingresarButton.addTarget(self, action: "startApp", forControlEvents: UIControlEvents.TouchUpInside)
        ingresarButton.layer.cornerRadius = 20
        self.view.addSubview(ingresarButton)
        
        ingresarFacebookButton = UIButton()
        ingresarFacebookButton.backgroundColor = .blueColor()
        ingresarFacebookButton.setTitle("INGRESAR CON FACEBOOK", forState: UIControlState.Normal)
        ingresarFacebookButton.addTarget(self, action: "loginFacebook", forControlEvents: UIControlEvents.TouchUpInside)
        ingresarFacebookButton.layer.cornerRadius = 20
        self.view.addSubview(ingresarFacebookButton)
        
        setupConstrains()
        
    }
    
    
    func setupConstrains(){
    
        emailView.autoSetDimension(ALDimension.Height, toSize: 60)
        emailView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        emailView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        emailView.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self.view, withOffset: self.view.frame.height / 2)
    
        passwordView.autoSetDimension(ALDimension.Height, toSize: 60)
        passwordView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        passwordView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        passwordView.autoPinEdge(ALEdge.Top, toEdge: .Bottom, ofView: emailView, withOffset: 30 )
    
        ingresarButton.autoSetDimension(ALDimension.Height, toSize: 40)
        ingresarButton.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        ingresarButton.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        ingresarButton.autoPinEdge(ALEdge.Top, toEdge: .Bottom, ofView: passwordView, withOffset: 30)
        
        ingresarFacebookButton.autoSetDimension(ALDimension.Height, toSize: 40)
        ingresarFacebookButton.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        ingresarFacebookButton.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        ingresarFacebookButton.autoPinEdge(ALEdge.Top, toEdge: .Bottom, ofView: ingresarButton, withOffset: 30)
        
    }
    
    func startApp(){
    
    }
    
    func loginFacebook(){
        
    }
    
}
