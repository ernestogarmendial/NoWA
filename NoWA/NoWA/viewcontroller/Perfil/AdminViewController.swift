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
        self.tabla!.registerClass(ConfigTableViewCell.self, forCellReuseIdentifier: "Config")
        self.tabla!.registerClass(TorneoAdminTableViewCell.self, forCellReuseIdentifier: "Tournament")
        
        self.myRefresh.addTarget(self, action: #selector(AdminViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
        self.myRefresh.tintColor = .whiteColor()
        tabla!.addSubview(myRefresh)
        
        callService()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let myBackButton:UIButton = UIButton(type: .Custom) as UIButton
        myBackButton.addTarget(self, action: #selector(AdminViewController.popToRoot(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle(NSLocalizedString("< Volver", comment: ""), forState: UIControlState.Normal)
        myBackButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem

    }
    
    func popToRoot(sender:UIBarButtonItem){
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
    
    func callService(){
        let tournamentService : TournamentService = TournamentService()
        tournamentService.getTournaments(token: UserService.currentUser.token,target: self,message: "getTournamentsFinish:")
    }
    
    
    func getTournamentsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error Admin")
            return
        }
        
        self.cellsArray = result.entityForKey("TournamentsAdmin") as? [TournamentAdminDTO]
        
        dispatch_async(dispatch_get_main_queue()) {
            self.tabla!.reloadData()
        }
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
            torneosAdminViewController.torneo = self.cellsArray[indexPath.row - 2] as TournamentAdminDTO
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
            configTableViewCell.configLabel!.text = NSLocalizedString("Mis Torneos", comment: "")
            return configTableViewCell
        }
        
        let torneoAdminTableViewCell = self.tabla!.dequeueReusableCellWithIdentifier("Tournament", forIndexPath: indexPath) as! TorneoAdminTableViewCell
        
        if self.cellsArray != nil {
            let torneo = self.cellsArray[indexPath.row - 2] as TournamentAdminDTO
            torneoAdminTableViewCell.tournamentName!.text = torneo.name
        }
        
        return torneoAdminTableViewCell
        
    }
    
    func refresh () {
        dispatch_async(dispatch_get_main_queue()) {

        self.callService()
        self.tabla!.reloadData()
        self.myRefresh.endRefreshing()
        }
    }
    
}
