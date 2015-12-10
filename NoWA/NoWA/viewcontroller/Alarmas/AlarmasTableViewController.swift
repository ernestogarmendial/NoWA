//
//  AlarmasTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AlarmasTableViewController: GenericTableViewController {
    
    var registerArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(InfoAlarmTableViewCell.self, forCellReuseIdentifier: "celda1")
        self.tableView.registerClass(ItemTableViewCell.self, forCellReuseIdentifier: "celda2")
        
        self.tableView.backgroundColor = .redColor()
        
        let path = NSBundle.mainBundle().pathForResource("AlarmasCells", ofType: "plist")
        self.registerArray = NSMutableArray(contentsOfFile: path!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registerArray.count
    }
    
    override     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 60
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identificador = registerArray[indexPath.row]["identifier"] as! String
        
        let genericCell = tableView.dequeueReusableCellWithIdentifier(identificador, forIndexPath: indexPath) as! GenericTableViewCell
        
        return genericCell
    }
    
}
