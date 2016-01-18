//
//  PerfilTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PerfilTableViewController: GenericTableViewController, ButtonFooterDelegate {
    
    var cellsArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(PictureTableViewCell.self, forCellReuseIdentifier: "Picture")
        self.tableView.registerClass(AddressTableViewCell.self, forCellReuseIdentifier: "Address")
        self.tableView.registerClass(ConfigTableViewCell.self, forCellReuseIdentifier: "Config")
        self.tableView.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "ButtonCell")
        
        
        let path = NSBundle.mainBundle().pathForResource("PerfilTabCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellsArray != nil{
            return cellsArray.count
        }else{
            return 0
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        let height = cellsArray[indexPath.row]["height"] as! CGFloat
        return height
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identificador = cellsArray[indexPath.row]["identifier"] as! String
        
        let genericCell = self.tableView.dequeueReusableCellWithIdentifier(identificador, forIndexPath: indexPath) as! GenericTableViewCell
        
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
    override func createButtonPressed() {
        print("create")
    }
}
