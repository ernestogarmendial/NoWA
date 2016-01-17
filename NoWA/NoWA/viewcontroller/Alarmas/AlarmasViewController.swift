//
//  AlarmasViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AlarmasViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource {
    
    var alarmsArray: [PersonalAlarmDTO]!
    var alarms: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGrayCustomColor()
        
        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        
        self.tabla!.registerClass(AlarmItemTableViewCell.self, forCellReuseIdentifier: "alarmItem")
        
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
        
        self.alarmsArray = result.entityForKey("PersonalAlarms") as? [PersonalAlarmDTO]
        
        self.tabla!.reloadData()
    }
    
    
    func addAlarm(){
        print("add Alarm")
        let newAlarmTableViewController = NewAlarmTableViewController()
        self.navigationController?.pushViewController(newAlarmTableViewController, animated:true )
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.alarmsArray != nil{
            if self.alarmsArray!.count > 0{
                return self.alarmsArray.count
            }
        }
        return 0 //////// si pongo 0 se mochea
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if self.alarmsArray != nil{
            let alarmCell = tableView.dequeueReusableCellWithIdentifier("alarmItem", forIndexPath: indexPath) as! AlarmItemTableViewCell
            
            alarmCell.setupAlarm(self.alarmsArray[indexPath.row])
            
            return alarmCell
        }
        else{
            let cell = UITableViewCell()
            return cell
        }
    }
    
}
