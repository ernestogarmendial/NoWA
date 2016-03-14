//
//  TorneosViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TorneosViewController: GenericViewController , UITableViewDelegate, UITableViewDataSource {
    
    var tournamentsArray: [TournamentDTO]!
    var alarms: NSMutableArray!
    
    var myRefresh = UIRefreshControl()
    var progressIcon = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGrayCustomColor()
        
        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        tabla!.tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: self.tabBarController!.tabBar.frame.height))
        
        self.tabla!.registerClass(TorneoItemTableViewCell.self, forCellReuseIdentifier: "tournamentItem")
        
        self.myRefresh.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.myRefresh.tintColor = .whiteColor()
        tabla!.addSubview(myRefresh)
        
        callService()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
    }
    
    
    func callService(){
        let alarmService : AlarmService = AlarmService()
        alarmService.getTournamentAlarms(token: UserService.currentUser.token,target: self,message: "getTournamentAlarmsFinish:")
    }
    
    
    func getTournamentAlarmsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            self.emptyStateView?.hidden = false
            tournamentsArray = []
            dispatch_async(dispatch_get_main_queue()) {
                self.tabla!.reloadData()
            }
            return
            
        }
        
        self.emptyStateView?.hidden = true
        
        self.tournamentsArray = result.entityForKey("TournamentAlarms") as? [TournamentDTO]
        
        tournamentsArray = tournamentsArray!.sort { $0.tournamentID!.compare($1.tournamentID!) == .OrderedAscending }
        
        dispatch_async(dispatch_get_main_queue()) {
            
            self.tabla!.reloadData()
        }
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tournamentsArray != nil{
            if tournamentsArray.count > 0{
                return tournamentsArray.count
            }
        }
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let currentCell = self.tabla?.cellForRowAtIndexPath(indexPath) as? TorneoItemTableViewCell
        
        let alert = UIAlertController(title: "CANCELAR" ,message:"Está seguro que desea eliminar la alarma de este torneo?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) in
            //            print("aca deberia llamar al metodo")
            //            let newAlarmDTO = AlarmDTO()
            //
            //                newAlarmDTO!.alarmID = currentCell
            //            }
            //            let alarmService : AlarmService = AlarmService()
            //            alarmService.deleteAlarm(alarmDTO: newAlarmDTO!, token: UserService.currentUser.token,target: self,message: "deleteAlarmFinish:")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
            print("Cancel")
        }))
        dispatch_async(dispatch_get_main_queue()) {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let torneoCell = tableView.dequeueReusableCellWithIdentifier("tournamentItem", forIndexPath: indexPath) as! TorneoItemTableViewCell
        
        if tournamentsArray != nil {
            torneoCell.torneoDTO = self.tournamentsArray[indexPath.row] as TournamentDTO
            
            //        torneoCell.setupTournament(self.tournamentsArray[indexPath.row])
        }
        return torneoCell
    }
    
    func refresh () {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            self.callService()
            self.tabla!.reloadData()
            self.myRefresh.endRefreshing()
            
        }
    }
    
}
