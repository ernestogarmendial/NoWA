//
//  AlarmasTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AlarmasTableViewController: GenericTableViewController {
    
    var alarmsArray: [PersonalAlarmDTO]!
    var alarms: NSMutableArray?
    
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
        
        self.alarmsArray = result.entityForKey("PersonalAlarms") as? [PersonalAlarmDTO]
        
        //        for alarm in alarmsArray! {
        //
        //            let event = alarm.event![0] as! EventDTO
        //            let alarm = alarm.weather![0] as! AlarmDTO
        //
        //            let dateFormatter = NSDateFormatter()
        //            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss.S" /*find out and place date format from http://userguide.icu-project.org/formatparse/datetime*/
        //            let date = dateFormatter.dateFromString(event.stamp!)
        //
        //            alarms!.addObject(event.eventID!)
        //        }
        
        self.tableView.reloadData()
    }
    
    
    func addAlarm(){
        print("add Alarm")
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.alarmsArray != nil{
            if self.alarmsArray!.count > 0{
                return self.alarmsArray.count
            }
        }
        return 1 //////// si pongo 0 se mochea
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
        
        let alarmCell = tableView.dequeueReusableCellWithIdentifier("alarmItem", forIndexPath: indexPath) as! AlarmItemTableViewCell
        
        if self.alarmsArray != nil{
            alarmCell.setupAlarm(self.alarmsArray.first!)
        }
        
        return alarmCell
        
    }
    
    //    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let alarmHeaderView : AlarmHeaderView = AlarmHeaderView(frame: CGRectMake(0, 0, self.view.frame.size.width, 1))
    //        return alarmHeaderView
    //    }
    //
    //    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 1
    //    }
    
    
    
}
