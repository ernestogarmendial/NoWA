//
//  RegisterViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/1/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

class RegisterViewController: UIViewController {
    
    var emailView : RegisterFieldView!
    var aceptTermsButton : UIButton!
    var aceptTermsLabel : UILabel!
    var ingresarButton : UIButton!
    var ingresarFacebookButton : UIButton!
    var createAccountButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .redColor()
        
        emailView = RegisterFieldView()
        emailView.backgroundColor = .greenColor()
        
        emailView.setupConstrains()
        self.view.addSubview(emailView)
        

        setupConstrains()
        
        
    }
    
    func setupConstrains(){
    
        emailView.autoSetDimension(ALDimension.Height, toSize: 60)
        emailView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        emailView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        emailView.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self.view, withOffset: 40 )
    
    }
    
}
