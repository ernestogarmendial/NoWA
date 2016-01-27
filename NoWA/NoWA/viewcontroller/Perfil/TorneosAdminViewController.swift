//
//  TorneosAdminViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 22/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TorneosAdminViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource, CancelEventDelegate {
    
    var torneo : TournamentAdminDTO!
    var cellsArray: [TournamentDTO]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .registroGrayColor()
        
        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        
        self.tabla!.registerClass(PictureTableViewCell.self, forCellReuseIdentifier: "Picture")
        self.tabla!.registerClass(TorneoCancelAllTableViewCell.self, forCellReuseIdentifier: "Cancel")
        self.tabla!.registerClass(TournamentEventTableViewCell.self, forCellReuseIdentifier: "Tournament")
        self.tabla!.registerClass(CancelEventButtonTableViewCell.self, forCellReuseIdentifier: "CancelButton")
        
        
        callService()
        
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
        
        self.tabla!.reloadData()
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
                let evento = self.cellsArray[indexPath.row - 2] as TournamentDTO
                eventTableViewCell.eventName!.text = evento.name
            }
            
            return eventTableViewCell
            
        }
    }
    
    func cancelButtonPressed(){
        print("delegado cancelar apretado")
        
        for var i = 2; i < self.cellsArray.count; i++ {
            
            let _indexPath = NSIndexPath(forRow: i, inSection: 0)
            let currentCell = self.tabla?.cellForRowAtIndexPath(_indexPath) as? TournamentEventTableViewCell
            
            if currentCell?.isCancel == true {
                print("evento nro \(i) cancelado")
            }
        }
        
    }
    
    
    
    
}
