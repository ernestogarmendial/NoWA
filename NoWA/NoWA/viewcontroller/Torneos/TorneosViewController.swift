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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGrayCustomColor()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tabla!.addGestureRecognizer(tap)
        
        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        tabla!.tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: self.tabBarController!.tabBar.frame.height))
        
        self.tabla!.registerClass(TorneoItemTableViewCell.self, forCellReuseIdentifier: "tournamentItem")
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
            return
        }
        
        self.tournamentsArray = result.entityForKey("TournamentAlarms") as? [TournamentDTO]
        
        self.tabla!.reloadData()
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
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let torneoCell = tableView.dequeueReusableCellWithIdentifier("tournamentItem", forIndexPath: indexPath) as! TorneoItemTableViewCell
        
        torneoCell.setupTournament(self.tournamentsArray[indexPath.row])
        
        return torneoCell
    }
    
}
