//
//  AlarmasViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AlarmasViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource {
    
    var alarmsArray: [PersonalAlarmDTO]?
    var sortedAlarmsArray: [PersonalAlarmDTO]?
    
    var alarms: NSMutableArray?
    
    var myRefresh = UIRefreshControl()
    var progressIcon = UIActivityIndicatorView()
    
    var reloadData : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGrayCustomColor()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tabla!.addGestureRecognizer(tap)
        
        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla!.delegate = self
        tabla!.dataSource = self
        tabla!.tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: self.tabBarController!.tabBar.frame.height))
        
        self.tabla!.registerClass(AlarmItemTableViewCell.self, forCellReuseIdentifier: "alarmItem")
        
        self.myRefresh.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.myRefresh.tintColor = .whiteColor()
        tabla!.addSubview(myRefresh)
        
//        callService()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let addAlarmButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addAlarm")
        self.tabBarController!.navigationItem.rightBarButtonItem = addAlarmButton
        self.refresh()
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
        
        sortedAlarmsArray = []
        for alarma in self.alarmsArray!{
            let event = alarma.event![0] as! EventDTO
            alarma.eventID = event.eventID
            print(alarma.eventID)
            
            sortedAlarmsArray?.append(alarma)
        }
        
        sortedAlarmsArray = sortedAlarmsArray!.sort { $0.eventID!.compare($1.eventID!) == .OrderedAscending }
        
        self.tabla!.reloadData()
    }
    
    
    func addAlarm(){
        print("add Alarm")
        let newAlarmViewController = NewAlarmViewController()
        self.navigationController?.pushViewController(newAlarmViewController, animated:true )
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.sortedAlarmsArray != nil{
            if self.sortedAlarmsArray!.count > 0{
                return self.sortedAlarmsArray!.count
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
        
        if self.sortedAlarmsArray != nil{
            let alarmCell = tableView.dequeueReusableCellWithIdentifier("alarmItem", forIndexPath: indexPath) as! AlarmItemTableViewCell
            
            alarmCell.reloadData = self.reloadData
            alarmCell.alarmDTO = self.sortedAlarmsArray![indexPath.row] as PersonalAlarmDTO
            //            alarmCell.setupAlarm()//(self.alarmsArray[indexPath.row])
            
            return alarmCell
        }
        else{
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func refresh () {
        
        self.callService()
        
        self.tabla!.reloadData()
        
        self.myRefresh.endRefreshing()
        
        reloadData = true
        
    }
    
}
