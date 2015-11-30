//
//  ViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 29/11/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var coverScrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .redColor()
        
        let boton = UIButton()
        boton.backgroundColor = .blueColor()
        
        self.view.addSubview(boton)
        
        boton.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.view)
        boton.autoAlignAxis(ALAxis.Horizontal, toSameAxisOfView: self.view)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

