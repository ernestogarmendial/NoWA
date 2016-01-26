//
//  AdminViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AdminViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellsArray: [TournamentAdminDTO]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .registroGrayColor()
        
        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        //        tabla?.allowsSelection = true
        
        self.tabla!.registerClass(PictureTableViewCell.self, forCellReuseIdentifier: "Picture")
        self.tabla!.registerClass(ConfigTableViewCell.self, forCellReuseIdentifier: "Config")
        self.tabla!.registerClass(TorneoAdminTableViewCell.self, forCellReuseIdentifier: "Tournament")
        
        callService()
        
    }
    
    func callService(){
        let tournamentService : TournamentService = TournamentService()
        tournamentService.getTournaments(token: UserService.currentUser.token,target: self,message: "getTournamentsFinish:")
    }
    
    
    func getTournamentsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        self.cellsArray = result.entityForKey("TournamentsAdmin") as? [TournamentAdminDTO]
        
        self.tabla!.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellsArray != nil{
            return cellsArray.count + 2
        }else{
            return 2
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row > 1 {
            
            let torneosAdminViewController = TorneosAdminViewController()
            self.navigationController?.pushViewController(torneosAdminViewController, animated: true)
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        if indexPath.row == 0{
            return 190
        } else if indexPath.row == 1{
            return 40
        } else {
            return 60
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let pictureCell = self.tabla!.dequeueReusableCellWithIdentifier("Picture", forIndexPath: indexPath) as! PictureTableViewCell
            pictureCell.leyendLabel?.hidden = true
            
            return pictureCell
        } else if indexPath.row == 1 {
            let configTableViewCell = self.tabla!.dequeueReusableCellWithIdentifier("Config", forIndexPath: indexPath) as! ConfigTableViewCell
            configTableViewCell.configLabel!.text = "Mis Torneos"
            return configTableViewCell
        }
        
        
        let torneoAdminTableViewCell = self.tabla!.dequeueReusableCellWithIdentifier("Tournament", forIndexPath: indexPath) as! TorneoAdminTableViewCell
        
        if self.cellsArray != nil {
            let torneo = self.cellsArray[indexPath.row - 2] as TournamentAdminDTO
            torneoAdminTableViewCell.tournamentName!.text = torneo.name
        }
        
        
        return torneoAdminTableViewCell
        
    }
    
}
