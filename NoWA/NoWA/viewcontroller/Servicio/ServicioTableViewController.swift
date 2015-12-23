//
//  ServicioTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ServicioTableViewController: GenericTableViewController {

    
//    var alarmsArray: NSMutableArray!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.tableView.registerClass(AlarmItemTableViewCell.self, forCellReuseIdentifier: "celda1")
//        //        self.tableView.registerClass(InfoAlarmTableViewCell.self, forCellReuseIdentifier: "celda2")
//        //        self.tableView.registerClass(ItemTableViewCell.self, forCellReuseIdentifier: "celda3")
//        
//        self.tableView.backgroundColor = .redColor()
//        
//        // not working
//        let addAlarmButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addAlarm")
//        self.navigationItem.rightBarButtonItem = addAlarmButton
//        // not working
//        
//        
//        let path = NSBundle.mainBundle().pathForResource("AlarmasCells", ofType: "plist")
//        self.alarmsArray = NSMutableArray(contentsOfFile: path!)
//        
//    }
    //        override func viewWillAppear(animated: Bool) {
//    super.viewWillAppear(true)
//    self.tabBarController!.navigationItem.rightBarButtonItem = nil
//}
//    func addAlarm(){
//        print("add Alarm")
//    }
//    
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4//return alarmsArray.count
//    }
//    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//        
//    }
//    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        
//    }
//    
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
//        return 60
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let identificador = alarmsArray[indexPath.row]["identifier"] as! String
//        
//        let genericCell = tableView.dequeueReusableCellWithIdentifier(identificador, forIndexPath: indexPath) as! GenericTableViewCell
//        
//        return genericCell
//    }
    
}
