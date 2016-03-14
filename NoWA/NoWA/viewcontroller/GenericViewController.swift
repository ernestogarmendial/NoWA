//
//  GenericViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 17/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController, ButtonFooterDelegate, UIGestureRecognizerDelegate {
    
    var tabla : UITableView?
    var pictureView : UIImageView?
    var emptyStateView : UIImageView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        self.navigationController?.interactivePopGestureRecognizer!.enabled = true
        
        //COMENTO PORQUE SINO NO PASA POR EL DIDSELECTROW AT INDEXPATH
        
        //        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        //        self.view.addGestureRecognizer(tap)
        
        //COMENTO PORQUE SINO NO PASA POR EL DIDSELECTROW AT INDEXPATH
        
        tabla = UITableView()
        tabla!.backgroundColor = .clearColor()
        tabla!.separatorColor = .clearColor()
        self.view.addSubview(tabla!)
        
        pictureView = UIImageView()
        self.view.addSubview(pictureView!)
        self.view.bringSubviewToFront(tabla!)
        
        emptyStateView = UIImageView()
        emptyStateView?.hidden = true
//        emptyStateView?.backgroundColor = .blueColor()
        self.view.addSubview(emptyStateView!)
        self.view.bringSubviewToFront(emptyStateView!)
        
        pictureView?.autoPinEdge(.Top, toEdge: .Top, ofView: self.view)
        pictureView?.autoPinEdge(.Left, toEdge: .Left, ofView: self.view, withOffset: -2)
        pictureView?.autoPinEdge(.Right, toEdge: .Right, ofView: self.view)
        pictureView?.autoSetDimension(.Height, toSize: 230)
        
        emptyStateView?.autoPinEdge(.Top, toEdge: .Bottom, ofView: pictureView!, withOffset: -30)
        emptyStateView?.autoPinEdge(.Left, toEdge: .Left, ofView: self.view, withOffset: 10)
        emptyStateView?.autoPinEdge(.Right, toEdge: .Right, ofView: self.view, withOffset: -10)
        emptyStateView?.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self.view, withOffset: -70)
        
        
        tabla?.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self.view)
        tabla?.autoPinEdge(.Top, toEdge: .Top, ofView: self.view, withOffset: 180)
        tabla?.autoPinEdge(.Left, toEdge: .Left, ofView: self.view)
        tabla?.autoPinEdge(.Right, toEdge: .Right, ofView: self.view)
        
    }
    
    func dismissKeyboard(){
        tabla!.endEditing(true)
    }
    
    func acceptButtonPressed(){
        print("accept")
    }
    func adminButtonPressed(){
        print("admin")
    }
    
    func createButtonPressed(){
        print("create")
    }
    
    func deleteButtonPressed() {
        print("delete")
    }
    
    func updateButtonPressed() {
        print("update")
    }
    
    func saveButtonPressed() {
        print("update")
    }
}
