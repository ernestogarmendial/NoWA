//
//  AlarmasTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AlarmasTableViewController: GenericTableViewController {
    
    var alarmsArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(AlarmItemTableViewCell.self, forCellReuseIdentifier: "alarmItem")
                
        callService()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let addAlarmButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addAlarm")
        self.tabBarController!.navigationItem.rightBarButtonItem = addAlarmButton
    }
    
    func callService(){
        let alarmService : AlarmService = AlarmService()
        alarmService.getPersonalAlarms(token: UserService.currentUser.token,target: self,message: "getPersonalAlarmsFinish:")
    }
    
    
    func getPersonalAlarmsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
//        self.defaultDataDTO = result.entityForKey("GetDefault") as? AlarmDTO
        
        self.tableView.reloadData()
    }

    
    func addAlarm(){
        print("add Alarm")
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5//return alarmsArray.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 120
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        let identificador = alarmsArray[indexPath.row]["identifier"] as! String
        //
        let genericCell = tableView.dequeueReusableCellWithIdentifier("alarmItem", forIndexPath: indexPath) as! GenericTableViewCell
        
        return genericCell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let alarmHeaderView : AlarmHeaderView = AlarmHeaderView(frame: CGRectMake(0, 0, self.view.frame.size.width, 1))
        return alarmHeaderView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    

    
}
