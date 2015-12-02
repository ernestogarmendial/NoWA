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
    var ingresarButton : UIButton!
    var ingresarFacebookButton : UIButton!
    var createAccountButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "login")!)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tap)
        
        emailView = RegisterFieldView()
        emailView.backgroundColor = .grayColor()
        emailView.setItems(nil,placeholder: "TU CORREO", recover: false, secureMode: false)
        self.view.addSubview(emailView)
        
        passwordView = RegisterFieldView()
        passwordView.backgroundColor = .orangeColor()
        passwordView.setItems(nil,placeholder: "CONTRASENIA", recover: true, secureMode: true)
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
        
        createAccountButton = UIButton()
        createAccountButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        createAccountButton.backgroundColor = .brownColor()
        createAccountButton.setTitle("CREAR UNA CUENTA", forState: UIControlState.Normal)
        createAccountButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        createAccountButton.addTarget(self, action: "createAccount", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(createAccountButton)
        
        setupConstrains()
        
    }
    
    
    func setupConstrains(){
        
        ingresarButton.autoSetDimension(ALDimension.Height, toSize: 50)
        ingresarButton.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        ingresarButton.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        ingresarButton.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self.view, withOffset: self.view.frame.height * 0.65)
        
        ingresarFacebookButton.autoSetDimension(ALDimension.Height, toSize: 50)
        ingresarFacebookButton.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        ingresarFacebookButton.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        ingresarFacebookButton.autoPinEdge(ALEdge.Top, toEdge: .Bottom, ofView: ingresarButton, withOffset: 20)
        
        createAccountButton.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.view)
        createAccountButton.autoSetDimension(ALDimension.Height, toSize: 40)
        createAccountButton.autoSetDimension(ALDimension.Width, toSize: 200)
        createAccountButton.autoPinEdge(ALEdge.Top, toEdge: .Bottom, ofView: ingresarFacebookButton, withOffset: 20)
        
        passwordView.autoSetDimension(ALDimension.Height, toSize: 50)
        passwordView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        passwordView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        passwordView.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: ingresarButton, withOffset: -20 )
        
        emailView.autoSetDimension(ALDimension.Height, toSize: 50)
        emailView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        emailView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        emailView.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: passwordView, withOffset: -20)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func startApp(){
        
    }
    
    func loginFacebook(){
        
    }
    
    func createAccount(){
        let createAccountViewController = CreateAccountViewController()
        self.navigationController?.pushViewController(createAccountViewController, animated: true)
    }
    
}
