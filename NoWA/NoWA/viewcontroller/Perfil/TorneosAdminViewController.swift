//
//  TorneosAdminViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 22/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TorneosAdminViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource, CancelEventDelegate, CancelAllEventDelegate {
    
    var torneo : TournamentAdminDTO!
    var cellsArray: [TournamentDTO]!
    
    var myRefresh = UIRefreshControl()
    var progressIcon = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .registroGrayColor()
        
        let logoImage = UIImage(named:"logoNav")
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        
        self.tabla!.registerClass(PictureTableViewCell.self, forCellReuseIdentifier: "Picture")
        self.tabla!.registerClass(TorneoCancelAllTableViewCell.self, forCellReuseIdentifier: "Cancel")
        self.tabla!.registerClass(TournamentEventTableViewCell.self, forCellReuseIdentifier: "Tournament")
        self.tabla!.registerClass(CancelEventButtonTableViewCell.self, forCellReuseIdentifier: "CancelButton")
        
        self.myRefresh.addTarget(self, action: #selector(TorneosAdminViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
        self.myRefresh.tintColor = .whiteColor()
        tabla!.addSubview(myRefresh)
        
        callService()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let myBackButton:UIButton = UIButton(type: .Custom) as UIButton
        myBackButton.addTarget(self, action: #selector(TorneosAdminViewController.popToRoot(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle(NSLocalizedString("< Volver", comment: ""), forState: UIControlState.Normal)
        myBackButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
    }
    
    
    func popToRoot(sender:UIBarButtonItem){
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKindOfClass(AdminViewController) {
                self.navigationController?.popToViewController(controller as UIViewController, animated: true)
                break
            }
        }
    }
    
    func callService(){
        let tournamentService : TournamentService = TournamentService()
        tournamentService.getTournamentsEvents(tournamentID: torneo!.tournamentID,token: UserService.currentUser.token,target: self,message: "getTournamentEventsFinish:")
    }
    
    
    func getTournamentEventsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        self.cellsArray = result.entityForKey("TournamentEvents") as? [TournamentDTO]
        
        self.cellsArray = self.cellsArray!.sort { $0.tournamentID!.compare($1.tournamentID!) == .OrderedAscending }
        
        dispatch_async(dispatch_get_main_queue()) {
            
            self.tabla!.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellsArray != nil{
            return cellsArray.count + 3
        }else{
            return 2
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row > 1 && indexPath.row != cellsArray.count + 3 {
            
            let currentCell = self.tabla?.cellForRowAtIndexPath(indexPath) as? TournamentEventTableViewCell
            currentCell!.checkCancel()
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        if indexPath.row == 0{
            return 190
        } else if indexPath.row == 1{
            return 40
        } else {
            return 80
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let pictureCell = self.tabla!.dequeueReusableCellWithIdentifier("Picture", forIndexPath: indexPath) as! PictureTableViewCell
            pictureCell.leyendLabel?.hidden = true
            
            return pictureCell
        } else if indexPath.row == 1 {
            let configTableViewCell = self.tabla!.dequeueReusableCellWithIdentifier("Cancel", forIndexPath: indexPath) as! TorneoCancelAllTableViewCell
            configTableViewCell.configLabel!.text = self.torneo?.name
            configTableViewCell.cancelAllDelegate = self
            return configTableViewCell
        } else {
            
            if self.cellsArray != nil {
                if indexPath.row == self.cellsArray.count + 2{
                    let cancelButtonCell = self.tabla!.dequeueReusableCellWithIdentifier("CancelButton", forIndexPath: indexPath) as! CancelEventButtonTableViewCell
                    cancelButtonCell.cancelDelegate = self
                    return cancelButtonCell
                }
            }
            
            let eventTableViewCell = self.tabla!.dequeueReusableCellWithIdentifier("Tournament", forIndexPath: indexPath) as! TournamentEventTableViewCell
            
            if self.cellsArray != nil {
                let evento : TournamentDTO = self.cellsArray[indexPath.row - 2] as TournamentDTO
                eventTableViewCell.setValues(evento)
            }
            
            return eventTableViewCell
            
        }
    }
    
    func cancelButtonPressed(){
        print("delegado cancelar apretado")
        
        var cancelIds : String = ""
        
        if self.cellsArray != nil {
            if self.cellsArray.count != 0 {
                
                for i in 0 ..< self.cellsArray.count {
                    
                    let _indexPath = NSIndexPath(forRow: i + 2, inSection: 0)
                    let currentCell = self.tabla?.cellForRowAtIndexPath(_indexPath) as? TournamentEventTableViewCell
                    
                    if currentCell?.isCancel == true {
                        
                        if cancelIds == ""{
                            cancelIds = (currentCell!.tournamentID!.stringValue)
                        }else{
                            cancelIds = cancelIds + "-\(currentCell!.tournamentID!.stringValue)"
                        }
                    }
                }
            }
        }
        
        print(cancelIds)
        
        if cancelIds != ""{
            let alarmService : AlarmService = AlarmService()
            alarmService.cancelAlarm(alarmID: 0,tournamentIDs: cancelIds, value: 0, token: UserService.currentUser.token, target: self, message: "cancelAlarm:")
        }
    }
    
    
    
    
    
    func cancelAlarm (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        
        let alert = UIAlertController(title: NSLocalizedString("CANCELAR", comment: ""), message: NSLocalizedString("Cancelación Exitosa", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        dispatch_async(dispatch_get_main_queue()) {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        self.refresh()
        
    }
    
    func cancelAllButtonPressed(){
        print("delegado cancelar todo apretado")
        
        if self.cellsArray != nil {
            if self.cellsArray.count != 0 {
                
                let alert = UIAlertController(title: NSLocalizedString("CANCELAR TODO", comment: "") ,message:NSLocalizedString("Está seguro que desea cancelar todas las alarmas de este torneo?", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) in
                    self.cancelAllAlarms()
                }))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
                    print("Cancel")
                }))
                dispatch_async(dispatch_get_main_queue()) {
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    func refresh () {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            self.callService()
            self.tabla!.reloadData()
            self.myRefresh.endRefreshing()
            
        }
    }
    
    func cancelAllAlarms(){
        var cancelIds : String = ""
        
        if self.cellsArray != nil {
            if self.cellsArray.count != 0 {
                
                for i in 0 ..< self.cellsArray.count {
                    
                    let _indexPath = NSIndexPath(forRow: i + 2, inSection: 0)
                    let currentCell = self.tabla?.cellForRowAtIndexPath(_indexPath) as? TournamentEventTableViewCell
                    
                    if cancelIds == ""{
                        cancelIds = (currentCell!.tournamentID!.stringValue)
                    }else{
                        cancelIds = cancelIds + "-\(currentCell!.tournamentID!.stringValue)"
                    }
                    
                }
            }
        }
        print(cancelIds)
        
        let alarmService : AlarmService = AlarmService()
        alarmService.cancelAlarm(alarmID: 0,tournamentIDs: cancelIds, value: 0, token: UserService.currentUser.token, target: self, message: "cancelAlarm:")
        
    }
    
}
