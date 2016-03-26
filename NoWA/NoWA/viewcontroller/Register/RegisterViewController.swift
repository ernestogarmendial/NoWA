//
//  RegisterViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/1/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

class RegisterViewController: LoginViewController {
    
    var backgroundImage : UIImageView!
    var emailView : RegisterFieldView!
    var passwordView : RegisterFieldView!
    var ingresarButton : TTPopButton!
    var ingresarFacebookButton : TTPopButton!
    var createAccountButton : TTPopButton!
    var recoverButton : TTPopButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "login")
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(backgroundImage)
        
        emailView = RegisterFieldView()
        var languajeCode = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode)!
        emailView.setItems("envelope",placeholder: NSLocalizedString("TU CORREO", comment: ""), secureMode: false)
        self.view.addSubview(emailView)
        
        passwordView = RegisterFieldView()
        passwordView.setItems("lock",placeholder: NSLocalizedString("CONTRASEÑA", comment: ""), secureMode: true)
        self.view.addSubview(passwordView)
        
        ingresarButton = TTPopButton()
        ingresarButton.backgroundColor = .loginRedColor()
        ingresarButton.setTitle(NSLocalizedString("INGRESAR", comment: ""), forState: UIControlState.Normal)
        ingresarButton.titleLabel!.font = UIFont.appLatoFontOfSize(15)
        ingresarButton.addTarget(self, action: "login", forControlEvents: UIControlEvents.TouchUpInside)
        ingresarButton.layer.cornerRadius = 20
        self.view.addSubview(ingresarButton)
        
        ingresarFacebookButton = TTPopButton()
        ingresarFacebookButton.backgroundColor = .loginBlueColor()
        ingresarFacebookButton.setTitle(NSLocalizedString("INGRESAR CON FACEBOOK", comment: ""), forState: UIControlState.Normal)
        ingresarFacebookButton.titleLabel!.font = UIFont.appLatoFontOfSize(15)
        ingresarFacebookButton.addTarget(self, action: "loginFacebook", forControlEvents: UIControlEvents.TouchUpInside)
        ingresarFacebookButton.layer.cornerRadius = 20
        self.view.addSubview(ingresarFacebookButton)
        
        createAccountButton = TTPopButton()
        createAccountButton.titleLabel!.font = UIFont.appLatoFontOfSize(12)
        createAccountButton.setTitle(NSLocalizedString("CREAR UNA CUENTA", comment: ""), forState: UIControlState.Normal)
        createAccountButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        createAccountButton.addTarget(self, action: "createAccount", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(createAccountButton)
        
        recoverButton = TTPopButton()
        recoverButton.backgroundColor = .clearColor()
        recoverButton.setTitle(NSLocalizedString("RECUPERAR", comment: ""), forState: UIControlState.Normal)
        recoverButton.setTitleColor(.whiteColor(), forState: UIControlState.Normal)
        recoverButton.titleLabel!.font = UIFont.appLatoFontOfSize(12)
        recoverButton.titleLabel?.adjustsFontSizeToFitWidth = true
        recoverButton.addTarget(self, action: "recover", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(recoverButton)
        
        self.view.bringSubviewToFront(recoverButton)
        setupConstrains()
        
    }
    
    
    func setupConstrains(){
        
        backgroundImage.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self.view)
        backgroundImage.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: self.view)
        backgroundImage.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view)
        backgroundImage.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view)
        
        ingresarButton.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.view)
        ingresarButton.autoSetDimension(ALDimension.Height, toSize: 40)
        ingresarButton.autoSetDimension(ALDimension.Width, toSize: self.view.frame.width * 0.7)
        ingresarButton.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self.view, withOffset: self.view.frame.height * 0.68)
        
        ingresarFacebookButton.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.view)
        ingresarFacebookButton.autoSetDimension(ALDimension.Height, toSize: 40)
        ingresarFacebookButton.autoSetDimension(ALDimension.Width, toSize: self.view.frame.width * 0.7)
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
        
        recoverButton.autoPinEdge(.Top, toEdge: .Top, ofView: passwordView)
        recoverButton.autoPinEdge(.Right, toEdge: .Right, ofView: passwordView)
        recoverButton.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: passwordView)
        recoverButton.autoMatchDimension(.Width, toDimension: .Width, ofView: passwordView, withMultiplier: 0.4)
        
    }
    
    
    
    func loginFacebook(){
        
        let login = FBSDKLoginManager()
        login.loginBehavior = .SystemAccount
        login.logInWithReadPermissions(["public_profile","email"], fromViewController: self, handler: { (result, error) -> Void in
            if (error == nil){
                print("logeado")
                
                let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters:["fields":"email,id,name,picture.width(480).height(480)"])
                graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                    
                    if ((error) != nil)
                    {
                        // Process error
                        print("Error: \(error)")
                    }
                    else
                    {
                        print("fetched user: \(result)")
                        let userName : NSString = result.valueForKey("name") as! NSString
                        print("User Name is: \(userName)")
                        let userEmail : NSString = result.valueForKey("email") as! NSString
                        print("User Email is: \(userEmail)")
                        let fbID : NSString = result.valueForKey("id") as! NSString
                        
                        self.callFacebookService(userName, email: userEmail, fbID : fbID)
                    }
                })
                
            }else{
                print("error")
            }
            }
        )
    }
    
    func createAccount(){
        
        let createAccountViewController = CreateAccountViewController()
        self.navigationController?.pushViewController(createAccountViewController, animated: true)
    }
    
    func login(){
        
        callService()
    }
    
    
    func callService () {
        let userService : UserService = UserService()
        userService.login(emailView.inputTextField.text, code: passwordView.inputTextField.text ,target: self,message: "loginFinish:")
    }
    
    func loginFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error login")
            
            let alert = UIAlertController(title: "Error", message: NSLocalizedString("Usuario o contraseña inválida", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
            return
        }
        
        NSUserDefaults.standardUserDefaults().setValue(emailView.inputTextField.text, forKey: "email")
        NSUserDefaults.standardUserDefaults().setValue(passwordView.inputTextField.text, forKey: "pass")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        let usuarioLogueado:UserDTO = result.entityForKey("User") as! UserDTO
        if usuarioLogueado.token != nil {
            dispatch_async(dispatch_get_main_queue()) {
                self.startApp()
            }
            
        }
        
    }
    
    func recover(){
        
        if emailView.inputTextField.text != nil{
            if emailView.inputTextField.text != ""{
                print("recover")
                let userService : UserService = UserService()
                userService.recover(emailView.inputTextField.text,target: self,message: "recoverFinish:")
            }
        }
    }
    
    
    func recoverFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error register")
            return
        }
        
        let recoverDTO:RecoverDTO = result.entityForKey("RecoverCode") as! RecoverDTO
        if recoverDTO.code != "" {
            let alert = UIAlertController(title: "Nueva Contraseña:", message: recoverDTO.code, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    
    func callFacebookService(username: NSString!, email: NSString!, fbID : NSString!){
        let userService : UserService = UserService()
        userService.loginFacebook(username, email:  email, fbID: fbID ,target: self,message: "loginFacebookFinish:")
    }
    
    func loginFacebookFinish(result : ServiceResult!){
        if(result.hasErrors()){
            print("Error login face")
            
            let alert = UIAlertController(title: "Error", message: NSLocalizedString("Usuario o contraseña inválida", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
            return
        }
        
        let usuarioLogueado:UserDTO = result.entityForKey("UserFB") as! UserDTO
        if usuarioLogueado.token != nil {
            dispatch_async(dispatch_get_main_queue()) {
                self.startApp()
            }
            
        }
    }
    
}
