//
//  PerfilViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PerfilViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellsArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Perfil"
        
        self.view.backgroundColor = .registroGrayColor()
        
        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        tabla!.tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: self.tabBarController!.tabBar.frame.height))
        
        self.tabla!.registerClass(PictureTableViewCell.self, forCellReuseIdentifier: "Picture")
        self.tabla!.registerClass(AddressTableViewCell.self, forCellReuseIdentifier: "Address")
        self.tabla!.registerClass(ConfigTableViewCell.self, forCellReuseIdentifier: "Config")
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
        //        genericCell.alarmDefaults = self.defaultDataDTO
        genericCell.tag = indexPath.row + 100
        
        //if identificador == "AcceptButtonCell"{
        genericCell.buttonDelegate = self
        //}
        return genericCell
    }
    
    override func adminButtonPressed(){
        let adminViewController = AdminViewController()
        self.navigationController?.pushViewController(adminViewController, animated:true )
        
    }
    
    override func acceptButtonPressed() {
        
        print("pepe")
    }
    
}
