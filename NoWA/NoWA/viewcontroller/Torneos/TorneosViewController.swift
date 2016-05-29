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
        
        let image = UIImage(named: "futbol_torneos")
        pictureView?.image = image
        
        let lang =  NSLocale.preferredLanguages().first! as NSString
        let language = lang.substringWithRange(NSRange(location: 0, length: 2))
        
        if language == "en" {
            let empty_torneos = UIImage(named: "empty_torneos_en")
            emptyStateView?.image = empty_torneos
        } else if language == "es" {
            let empty_torneos = UIImage(named: "empty_torneos")
            emptyStateView?.image = empty_torneos
        }
        
        
        
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
        self.refresh()
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
        print("edit tournament")
        
        let editAlarmViewController = EditTournamentViewController()
        
        let alarmCell = tabla?.cellForRowAtIndexPath(indexPath) as! TorneoItemTableViewCell
        
        let alarma = self.tournamentsArray![indexPath.row] as TournamentDTO
        
        if alarma.status != 2 {
            
            
            if alarmCell.alarmSwitch!.selected == true {
                print("esta inactiva")
                editAlarmViewController.alarmStatus = 0
            }else{
                print("esta activa")
                editAlarmViewController.alarmStatus = 1
            }
            
            editAlarmViewController.editTournamentDTO = alarma
            
            
            self.navigationController?.pushViewController(editAlarmViewController, animated:true )
            
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
