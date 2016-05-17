//
//  CreateAccountViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/1/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import Social

class CreateAccountViewController: LoginViewController, UIGestureRecognizerDelegate {
    
    var backgroundImage : UIImageView!
    var checkButton : UIButton!
    var aceptTermsButton : UIButton!
    var emailView : RegisterFieldView!
    var passwordView : RegisterFieldView!
    var confirmView : RegisterFieldView!
    var ingresarButton : TTPopButton!
    var termsView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        self.navigationController?.interactivePopGestureRecognizer!.enabled = true
        
        self.title = NSLocalizedString("REGISTRO", comment: "")
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "registro")!)
        
        backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "registro")
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(backgroundImage)
        
        emailView = RegisterFieldView()
        emailView.setItems("envelope",placeholder: NSLocalizedString("TU CORREO", comment: ""), secureMode: false)
        self.view.addSubview(emailView)
        
        passwordView = RegisterFieldView()
        passwordView.setItems("lock",placeholder: NSLocalizedString("CONTRASEÑA", comment: ""), secureMode: true)
        self.view.addSubview(passwordView)
        
        confirmView = RegisterFieldView()
        confirmView.setItems("lock",placeholder: NSLocalizedString("CONFIRMAR", comment: ""), secureMode: true)
        self.view.addSubview(confirmView)
        
        ingresarButton = TTPopButton()
        ingresarButton.backgroundColor = .loginRedColor()
        ingresarButton.setTitle(NSLocalizedString("INGRESAR", comment: ""), forState: UIControlState.Normal)
        ingresarButton.titleLabel!.font = UIFont.appLatoFontOfSize(15)
        ingresarButton.addTarget(self, action: "register", forControlEvents: UIControlEvents.TouchUpInside)
        ingresarButton.layer.cornerRadius = 20
        self.view.addSubview(ingresarButton)
        
        aceptTermsButton = TTPopButton()
        aceptTermsButton.backgroundColor = .clearColor()
        aceptTermsButton.setTitle(NSLocalizedString("ACEPTO TÉRMINOS Y CONDICIONES", comment: ""), forState: UIControlState.Normal)
        aceptTermsButton.titleLabel!.font = UIFont.appLatoFontOfSize(12)
        aceptTermsButton.addTarget(self, action: "acceptTerms", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(aceptTermsButton)
        
        checkButton = TTPopButton()
        checkButton.backgroundColor = .clearColor()
        checkButton.setImage(UIImage(named: "tilde"), forState: UIControlState.Normal)
        checkButton.addTarget(self, action: "checkPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(checkButton)
        
        termsView = UIView()
        termsView.addSubview(aceptTermsButton)
        termsView.addSubview(checkButton)
        self.view.addSubview(termsView)
        
        setupConstrains()
        
    }
    
    func checkPressed (sender:UIButton) {
        
        sender.selected = !sender.selected;
        
        if sender.selected{
            sender.alpha = 0.2
        }else{
            sender.alpha = 1
        }
    }
    
    func acceptTerms() {
        let locUrl : String! = NSLocalizedString("http://nowakeapp.com/terminos.html", comment: "")
        print(locUrl)
        dispatch_async(dispatch_get_main_queue()) {
            UIApplication.sharedApplication().openURL(NSURL(string: locUrl)!)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let myBackButton:UIButton = UIButton(type: .Custom) as UIButton
        myBackButton.addTarget(self, action: "popToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle(NSLocalizedString("< Volver", comment: ""), forState: UIControlState.Normal)
        myBackButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
        
    }
    
    func popToRoot(sender:UIBarButtonItem){
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
    
    func setupConstrains() {
        
        backgroundImage.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self.view)
        backgroundImage.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: self.view)
        backgroundImage.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view)
        backgroundImage.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view)
        
        ingresarButton.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.view)
        ingresarButton.autoSetDimension(ALDimension.Height, toSize: 40)
        ingresarButton.autoSetDimension(ALDimension.Width, toSize: self.view.frame.width * 0.7)
        ingresarButton.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self.view, withOffset: self.view.frame.height * 0.68)
        
        checkButton.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: termsView)
        checkButton.autoAlignAxis(.Horizontal, toSameAxisOfView: termsView)
        checkButton.autoSetDimension(ALDimension.Height, toSize: 25)
        checkButton.autoSetDimension(ALDimension.Width, toSize: 25)
        
        aceptTermsButton.autoPinEdge(ALEdge.Left, toEdge: .Right, ofView: checkButton, withOffset: 10)
        aceptTermsButton.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: termsView)
        aceptTermsButton.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: termsView)
        aceptTermsButton.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: termsView)
        
        termsView.autoSetDimension(ALDimension.Height, toSize: 30)
        termsView.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.view)
        termsView.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: ingresarButton, withOffset: -20 )
        
        confirmView.autoSetDimension(ALDimension.Height, toSize: 50)
        confirmView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        confirmView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        confirmView.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: termsView, withOffset: -20 )
        
        passwordView.autoSetDimension(ALDimension.Height, toSize: 50)
        passwordView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        passwordView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        passwordView.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: confirmView, withOffset: -20 )
        
        emailView.autoSetDimension(ALDimension.Height, toSize: 50)
        emailView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        emailView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        emailView.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: passwordView, withOffset: -20)
        
    }
    
    func register(){
        
        if emailView.inputTextField.text == "" || passwordView.inputTextField.text == "" || confirmView.inputTextField.text == ""{
            let alert = UIAlertController(title: "Error", message: NSLocalizedString("Hay campos sin completar", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(alert, animated: true, completion: nil)
            }
            return
        }
        
        if passwordView.inputTextField.text !=  confirmView.inputTextField.text {
            let alert = UIAlertController(title: "Error", message: NSLocalizedString("Las contraseñas no coinciden", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(alert, animated: true, completion: nil)
            }
            return
        }
        
        if checkButton.alpha != 1 {
            let alert = UIAlertController(title: "Error", message: NSLocalizedString("Usted no ha aceptado los términos y condiciones.", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(alert, animated: true, completion: nil)
            }
            return
        }
        
        callService()
    }
    
    
    func callService () {
        let userService : UserService = UserService()
        userService.register(emailView.inputTextField.text, code: passwordView.inputTextField.text ,target: self,message: "registerFinish:")
    }
    
    func registerFinish (result : ServiceResult!){
        if(result.hasErrors()){
            if ( result.errorsString() == "-1017\n" ){
                let alert = UIAlertController(title: "Error", message: NSLocalizedString("Esa cuenta ya existe. Ingrese una nueva.", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.presentViewController(alert, animated: true, completion: nil)
                }            }
            print("Error register")
            return
        }
        
        NSUserDefaults.standardUserDefaults().setValue(emailView.inputTextField.text, forKey: "email")
        NSUserDefaults.standardUserDefaults().setValue(passwordView.inputTextField.text, forKey: "pass")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        NSUserDefaults.standardUserDefaults().setValue("", forKey: "fbID")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let usuarioLogueado:UserDTO = result.entityForKey("RegisterUser") as! UserDTO
        if usuarioLogueado.token != nil {
            dispatch_async(dispatch_get_main_queue()) {
                self.startApp()
            }
            
        }
        
    }
    
    
}
