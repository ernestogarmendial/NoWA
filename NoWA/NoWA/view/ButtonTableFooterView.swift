//
//  ButtonTableFooterView.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

protocol ButtonFooterDelegate {
    func acceptButtonPressed() -> Void
    func adminButtonPressed() -> Void
    func createButtonPressed() -> Void
    func deleteButtonPressed() -> Void
    func updateButtonPressed() -> Void
    func saveButtonPressed() -> Void
}

class ButtonTableFooterView: GenericTableViewCell{
    
    var button : TTPopButton?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .serviceLocationColor()
        self.contentView.backgroundColor = .serviceLocationColor()
        
        button = TTPopButton()
        button!.titleLabel!.font = UIFont.appLatoFontOfSize(15)
        button!.layer.cornerRadius = 20
        self.addSubview(button!)
        
        button!.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self)
        button!.autoAlignAxis(ALAxis.Horizontal, toSameAxisOfView: self)
        button!.autoSetDimension(ALDimension.Height, toSize: 40)
        button!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.7)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func setItems(myDictionary: NSDictionary){
        
        
//        let language = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode)! as! String
        let lang =  NSLocale.preferredLanguages().first! as NSString
        let language = lang.substringWithRange(NSRange(location: 0, length: 2))
        
        if language == "en" {
            if let title = myDictionary["title_en"] as? String{
                button!.setTitle(title, forState: UIControlState.Normal)
            }
        }else if language == "es" {
            
            if let title = myDictionary["title"] as? String{
                button!.setTitle(title, forState: UIControlState.Normal)
            }
        }
        
        if let color = myDictionary["color"] as? String{
            button!.backgroundColor = UIColor.UIColorFromRGB("\(color)")
        }
        if let action = myDictionary["action"] as? String{
            
            if action == "accept"{
                button!.addTarget(self, action: #selector(ButtonTableFooterView.accept), forControlEvents: UIControlEvents.TouchUpInside)
            }
            if action == "save"{
                button!.addTarget(self, action: #selector(ButtonTableFooterView.save), forControlEvents: UIControlEvents.TouchUpInside)
            }
            if action == "close"{
                button!.addTarget(self, action: #selector(ButtonTableFooterView.close), forControlEvents: UIControlEvents.TouchUpInside)
            }
            if action == "admin"{
                
                if  UserService.currentUser.role != 1{
                    button?.hidden = true
                }
                
                button!.addTarget(self, action: #selector(ButtonTableFooterView.admin), forControlEvents: UIControlEvents.TouchUpInside)
            }
            if action == "create"{
                button!.addTarget(self, action: #selector(ButtonTableFooterView.create), forControlEvents: UIControlEvents.TouchUpInside)
            }
            if action == "update"{
                button!.addTarget(self, action: #selector(ButtonTableFooterView.update), forControlEvents: UIControlEvents.TouchUpInside)
            }
            if action == "delete"{
                button!.addTarget(self, action: #selector(ButtonTableFooterView.delete as (ButtonTableFooterView) -> () -> ()), forControlEvents: UIControlEvents.TouchUpInside)
            }
        }
    }
    
    func accept(){
        print("aceptar pressed")
        self.buttonDelegate!.acceptButtonPressed()
    }
    
    func save(){
        print("guardar pressed")
        self.buttonDelegate!.saveButtonPressed()
    }
    
    func close(){
        
        let userService : UserService = UserService()
        userService.logout(target: self,message: "logoutFinish:")
        
        print("close pressed")

    }
    
    func logoutFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error login")
            return
        }
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [RegisterViewController()]
        
        switchRootViewController(navigationController, animated: true, completion: nil)
        
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "email")
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "pass")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "loggeado")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func admin(){
        print("admin pressed")
        self.buttonDelegate!.adminButtonPressed()
    }
    
    func create(){
        print("admin pressed")
        self.buttonDelegate!.createButtonPressed()
    }
    
    func delete(){
        print("delete")
        self.buttonDelegate!.deleteButtonPressed()
    }
    
    func update(){
        print("update")
        self.buttonDelegate!.updateButtonPressed()
    }
    
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if animated {
            UIView.transitionWithView(UIApplication.sharedApplication().keyWindow!, duration: 0.5, options: .TransitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled()
                UIView.setAnimationsEnabled(false)
                UIApplication.sharedApplication().keyWindow?.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
                }, completion: { (finished: Bool) -> () in
                    if (completion != nil) {
                        completion!()
                    }
            })
        } else {
            UIApplication.sharedApplication().keyWindow?.rootViewController = rootViewController
        }
    }
    
}
