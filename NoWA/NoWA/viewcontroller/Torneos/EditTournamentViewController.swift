//
//  EditTournamentViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 17/3/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class EditTournamentViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource {
    
    var alarmStatus : NSNumber?
    
    var datetime : String?
    
    var cellsArray: NSMutableArray!
    
    var alarmID : NSNumber?
    
    var editTournamentDTO : TournamentDTO? {
        didSet{
            alarmID = self.editTournamentDTO!.tournamentID
        }
    }
    
    override func viewDidLoad() {
        
        print(ServicioViewController.defaultData)
        
        super.viewDidLoad()
        self.view.backgroundColor = .registroGrayColor()
        
        let logoImage = UIImage(named:"logoNav")
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tabla!.addGestureRecognizer(tap)
        
        tabla?.delegate = self
        tabla?.dataSource = self
        
        self.tabla!.registerClass(NewAlarmInsertTableViewCell.self, forCellReuseIdentifier: "Insert")
        self.tabla!.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "AcceptButtonCell")
        
        let path = NSBundle.mainBundle().pathForResource("EditTournamentCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let myBackButton:UIButton = UIButton(type: .Custom) as UIButton
        myBackButton.addTarget(self, action: "popToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle(NSLocalizedString("< Volver", comment: ""), forState: UIControlState.Normal)
        myBackButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
        
    }
    
    func popToRoot(sender:UIBarButtonItem){
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellsArray != nil{
            return cellsArray.count
        }else{
            return 0
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        let height = cellsArray[indexPath.row]["height"] as! CGFloat
        return height
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identificador = cellsArray[indexPath.row]["identifier"] as! String
        
        let genericCell = self.tabla!.dequeueReusableCellWithIdentifier(identificador, forIndexPath: indexPath) as! GenericTableViewCell
        
        if (self.editTournamentDTO != nil){
            genericCell.alarmStatus = self.alarmStatus
            genericCell.editTournamentDTO = self.editTournamentDTO
        }
        
        genericCell.myDictionary = cellsArray[indexPath.row] as? NSDictionary
        genericCell.tag = indexPath.row + 100
        if identificador == "AcceptButtonCell" {
            genericCell.buttonDelegate = self
        }
        
        if identificador == "Insert" {
            genericCell.hideRepetition()
        }
        
        return genericCell
    }
    
    override func updateButtonPressed() {
        
        print("hello")
        
        let insertCell = tabla!.viewWithTag(100) as! NewAlarmInsertTableViewCell
        
        // armar stamp con dia actual mas horario del picker
        setStamp(insertCell)
        
        
        let tournamentService : TournamentService = TournamentService()
        tournamentService.editTournaments(dateTime: self.datetime!, alarmID: self.alarmID!, token: UserService.currentUser.token,target: self,message: "editAlarmFinish:")
        
        
    }
    
    func setStamp(insertCell: NewAlarmInsertTableViewCell){
        
//        let formatter = NSNumberFormatter()
//        formatter.minimumIntegerDigits = 2
//        
//        let date = NSDate()
//        let calendar = NSCalendar.currentCalendar() //2015-11-24 17:00:49.0
//        let components = calendar.components([ .Year, .Month, .Day], fromDate: date)
//        let year = formatter.stringFromNumber(components.year)
//        let month = formatter.stringFromNumber(components.month)
//        let day = formatter.stringFromNumber(components.day)
    
        let timeLabel = insertCell.timeLabel!.text! as NSString
        
        let stamp = (editTournamentDTO?.stamp)! as NSString
        let year = stamp.substringWithRange(NSRange(location: 0, length: 4))
        let month = stamp.substringWithRange(NSRange(location: 5, length: 2))
        let day = stamp.substringWithRange(NSRange(location: 8, length: 2))
        
        let hour = timeLabel.substringWithRange(NSRange(location: 0, length: 2))
        let minute = timeLabel.substringWithRange(NSRange(location: 3, length: 2))
        
        //        dd-MM-yyyy-HH-mm-ss
        self.datetime = "\(day)-\(month)-\(year)-\(hour)-\(minute)-00"
    }
    
    
    func editAlarmFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error edit")
            return
        }
        
        
        let alert = UIAlertController(title: "Se ha actualizado la alarma", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  { (action: UIAlertAction!) in
            self.navigationController!.popToRootViewControllerAnimated(true)
        }))
        
        dispatch_async(dispatch_get_main_queue()) {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }
    
}
