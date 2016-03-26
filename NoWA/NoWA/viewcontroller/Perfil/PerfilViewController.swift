//
//  PerfilViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PerfilViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource, WebButtonDelegate {
    
    var cellsArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Perfil", comment: "")
        
        self.view.backgroundColor = .registroGrayColor()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tabla!.addGestureRecognizer(tap)
        
        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        tabla!.tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: self.tabBarController!.tabBar.frame.height))
        
        self.tabla!.registerClass(PictureTableViewCell.self, forCellReuseIdentifier: "Picture")
        self.tabla!.registerClass(AddressTableViewCell.self, forCellReuseIdentifier: "Address")
        self.tabla!.registerClass(ConfigTableViewCell.self, forCellReuseIdentifier: "Config")
        self.tabla!.registerClass(WebProfileTableViewCell.self, forCellReuseIdentifier: "Web")
        self.tabla!.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "ButtonCell")
        
        
        let path = NSBundle.mainBundle().pathForResource("PerfilTabCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellsArray != nil{
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
        
        let facebookAddress = tabla!.viewWithTag(102) as! AddressTableViewCell
        if let facebook = facebookAddress.addressTextField!.text{
            updateDTO.facebook = facebook
        }
        
        let twitterAddress = tabla!.viewWithTag(103) as! AddressTableViewCell
        if let twitter = twitterAddress.addressTextField!.text{
            updateDTO.twitter = twitter
            
        }
        
        let instagramAddress = tabla!.viewWithTag(104) as! AddressTableViewCell
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
        UIApplication.sharedApplication().openURL(NSURL(string: NSLocalizedString("http://nowakeapp.com/terminos.html", comment: ""))!)

    }
    
}
