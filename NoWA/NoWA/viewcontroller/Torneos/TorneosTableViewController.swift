//
//  TorneosTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TorneosTableViewController: GenericTableViewController {
    
    var tournamentsArray: [TournamentDTO]!
    var alarms: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(TorneoItemTableViewCell.self, forCellReuseIdentifier: "tournamentItem")
        callService()
        
    }
    
    
    func callService(){
        let alarmService : AlarmService = AlarmService()
        alarmService.getTournamentAlarms(token: UserService.currentUser.token,target: self,message: "getTournamentAlarmsFinish:")
    }
    
    
    func getTournamentAlarmsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        self.tournamentsArray = result.entityForKey("TournamentAlarms") as? [TournamentDTO]
        
        self.tableView.reloadData()
    }
    
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tournamentsArray != nil{
            if tournamentsArray.count > 0{
                return tournamentsArray.count
            }
        }
        return 0
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

        let torneoCell = tableView.dequeueReusableCellWithIdentifier("tournamentItem", forIndexPath: indexPath) as! TorneoItemTableViewCell
       
        torneoCell.setupTournament(self.tournamentsArray[indexPath.row])
        
        return torneoCell
    }
    
}
