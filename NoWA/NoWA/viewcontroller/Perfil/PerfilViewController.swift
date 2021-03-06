//
//  PerfilViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit
import Social

class PerfilViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource, WebButtonDelegate, ShareSocialTableViewCellDelegate {
    
    var cellsArray: NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Perfil", comment: "")
        
        self.view.backgroundColor = .registroGrayColor()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tabla!.addGestureRecognizer(tap)
        
        let image = UIImage(named: "running_perfil")
        pictureView?.image = image
        
        let lang =  NSLocale.preferredLanguages().first! as NSString
        let language = lang.substringWithRange(NSRange(location: 0, length: 2))
        
        if language == "en" {
            let empty_perfil = UIImage(named: "empty_perfil_en")
            emptyStateView?.image = empty_perfil
        } else if language == "es" {
            let empty_perfil = UIImage(named: "empty_perfil")
            emptyStateView?.image = empty_perfil
        }

        
        tabla?.delegate = self
        tabla?.dataSource = self
        tabla!.tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: self.tabBarController!.tabBar.frame.height))
        
        self.tabla!.registerClass(PictureTableViewCell.self, forCellReuseIdentifier: "Picture")
        self.tabla!.registerClass(ShareSocialTableViewCell.self, forCellReuseIdentifier: "Share")
        self.tabla!.registerClass(AddressTableViewCell.self, forCellReuseIdentifier: "Address")
        self.tabla!.registerClass(ConfigTableViewCell.self, forCellReuseIdentifier: "Config")
        self.tabla!.registerClass(WebProfileTableViewCell.self, forCellReuseIdentifier: "Web")
        self.tabla!.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "ButtonCell")
        
        
        let path = NSBundle.mainBundle().pathForResource("PerfilTabCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
        if NSUserDefaults.standardUserDefaults().boolForKey("firstPerfil") == false {
            self.entendidoButton.hidden = false
            emptyStateView?.hidden = false
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstPerfil")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellsArray != nil && self.emptyStateView?.hidden == true {
            return cellsArray.count
        }else{
            return 0
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        let height = cellsArray[indexPath.row]["height"] as! CGFloat
        return height
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identificador = cellsArray[indexPath.row]["identifier"] as! String
        
        let genericCell = self.tabla!.dequeueReusableCellWithIdentifier(identificador, forIndexPath: indexPath) as! GenericTableViewCell
        
        genericCell.myDictionary = cellsArray[indexPath.row] as? NSDictionary
        genericCell.tag = indexPath.row + 100
        
        if identificador == "Web"{
            genericCell.webDelegate = self
        }
        
        if identificador == "Share"{
            genericCell.shareDelegate = self
        }
        
        if identificador == "ButtonCell"{
            genericCell.buttonDelegate = self
        }
        
        return genericCell
    }
    
    override func adminButtonPressed(){
        if UserService.currentUser.role == 1{
            let adminViewController = AdminViewController()
            self.navigationController?.pushViewController(adminViewController, animated:true )
        }else{
            print("no es admin")
        }
        
    }
    
    override func acceptButtonPressed() {
        
        print("pepe")
    }
    
    override func saveButtonPressed() {
        print("guardar")
        
        let updateDTO = UserDTO()
        
        let pictureTableViewCell = tabla!.viewWithTag(100) as! PictureTableViewCell
        if let leyenda = pictureTableViewCell.leyendLabel!.text{
            updateDTO.phrase = leyenda
            updateDTO.username = pictureTableViewCell.nameLabel!.text
        }
        
        let facebookAddress = tabla!.viewWithTag(103) as! AddressTableViewCell
        if let facebook = facebookAddress.addressTextField!.text{
            updateDTO.facebook = facebook
        }
        
        let twitterAddress = tabla!.viewWithTag(104) as! AddressTableViewCell
        if let twitter = twitterAddress.addressTextField!.text{
            updateDTO.twitter = twitter
            
        }
        
        let instagramAddress = tabla!.viewWithTag(105) as! AddressTableViewCell
        if let instagram = instagramAddress.addressTextField!.text{
            updateDTO.instagram = instagram
            
        }
        
        print("")
        let userService : UserService = UserService()
        userService.update(updateDTO, token: UserService.currentUser.token! ,target: self,message: "updateFinish:")
    }
    
    func updateFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error update")
            return
        }
        
        if let userDTO:UserDTO = result.entityForKey("Update") as! UserDTO{
            let alert = UIAlertController(title: "", message: NSLocalizedString("Se han guardado tus datos", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
        }
    }
    
    func webButtonPressed(url: String){
        
        dispatch_async(dispatch_get_main_queue()) {
            UIApplication.sharedApplication().openURL(NSURL(string: url)!)
        }
        
    }
    
    func shareFb() {
        
        //        https://developers.facebook.com/docs/apps/review/prefill
        //        https://developers.facebook.com/docs/apps/review/prefill
        //        https://developers.facebook.com/docs/apps/review/prefill
        //        https://developers.facebook.com/docs/apps/review/prefill
        
        
        let screen = UIScreen.mainScreen()
        
        if let window = UIApplication.sharedApplication().keyWindow {
            UIGraphicsBeginImageContextWithOptions(screen.bounds.size, false, 0);
            window.drawViewHierarchyInRect(window.bounds, afterScreenUpdates: false)
            let composeSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            composeSheet.setInitialText("http://nowakeapp.com")
            composeSheet.addImage(UIImage(named: "panda"))
            composeSheet.addURL(NSURL(string: "http://nowakeapp.com")!)
            
            presentViewController(composeSheet, animated: true, completion: nil)
        }
    }
    func shareTwitter() {
        let screen = UIScreen.mainScreen()
        
        if let window = UIApplication.sharedApplication().keyWindow {
            UIGraphicsBeginImageContextWithOptions(screen.bounds.size, false, 0);
            window.drawViewHierarchyInRect(window.bounds, afterScreenUpdates: false)
            
            let composeSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            composeSheet.setInitialText("http://nowakeapp.com")
            composeSheet.addImage(UIImage(named: "panda"))
            composeSheet.addURL(NSURL(string: "http://nowakeapp.com")!)
            
            presentViewController(composeSheet, animated: true, completion: nil)
        }
    }
    
    func shareInstagram() {
//        dispatch_async(dispatch_get_main_queue()) {
//            UIApplication.sharedApplication().openURL(NSURL(string: "http://nowakeapp.com")!)
//        }
    }
    

    
}
