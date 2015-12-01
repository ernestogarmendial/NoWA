//
//  CreateAccountViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/1/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

class CreateAccountViewController: RegisterViewController {

    var aceptTermsButton : UIButton!
    var aceptTermsLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "REGISTRO"
        super.ingresarFacebookButton.hidden = true
        super.createAccountButton.hidden = true
    }
    
//    override func setupConstrains() {
//        
//    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = true;
        self.navigationController?.navigationBar.translucent = true;

        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.hidden = false
        
        self.navigationController?.navigationBar.backgroundColor = .clearColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage();
    }
    
}
