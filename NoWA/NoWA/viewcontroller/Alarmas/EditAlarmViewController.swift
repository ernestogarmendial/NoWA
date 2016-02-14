//
//  EditAlarmViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 12/2/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class EditAlarmViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource, DefaultCellDelegate {
    
    var newAlarmDTO : AlarmDTO?
    var newAlarmEventDTO : EventDTO?
    var cellsArray: NSMutableArray!
    
    var useDefaults : Bool? = false
    
    var datetime : String?
    
    var event : EventDTO?
    var weather : AlarmDTO?
    
    var alarmStatus : NSNumber?
    var isEditing : Bool?
    
    var alarmID : NSNumber?
    var editAlarmDTO : PersonalAlarmDTO?{
        didSet{
            self.event = editAlarmDTO!.event![0] as? EventDTO
            self.weather = editAlarmDTO!.weather![0] as? AlarmDTO
            
            alarmID = self.event!.eventID
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
        
        let image = UIImage(named: "create_alarm_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        
        self.tabla!.registerClass(NewAlarmInsertTableViewCell.self, forCellReuseIdentifier: "Insert")
        self.tabla!.registerClass(ServicePickerTableViewCell.self, forCellReuseIdentifier: "ServicePicker")
        self.tabla!.registerClass(PickerTableViewCell.self, forCellReuseIdentifier: "PickerCell")
        self.tabla!.registerClass(LocationTableViewCell.self, forCellReuseIdentifier: "LocationCell")
        self.tabla!.registerClass(DefaultCancelTableViewCell.self, forCellReuseIdentifier: "ServiceAdviceCell")
        self.tabla!.registerClass(SliderTableViewCell.self, forCellReuseIdentifier: "SliderCell")
        self.tabla!.registerClass(PredictionTableViewCell.self, forCellReuseIdentifier: "PredictionSliderCell")
        self.tabla!.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "AcceptButtonCell")
        self.tabla!.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "DeleteButtonCell")
        
        
        
        let path = NSBundle.mainBundle().pathForResource("EditAlarmCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let myBackButton:UIButton = UIButton(type: .Custom) as UIButton
        myBackButton.addTarget(self, action: "popToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle("< Volver", forState: UIControlState.Normal)
        myBackButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
        
        //        let button = UIButton(type: .Custom) as UIButton
        //        button.setImage(UIImage(named: "left_arrow"), forState: UIControlState.Normal)
        //        button.addTarget(self, action: "popToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
        //        button.frame=CGRectMake(0, 0, 30, 30)
        //        let barButton = UIBarButtonItem(customView: button)
        //        self.navigationItem.leftBarButtonItem = barButton
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
        
        if (self.editAlarmDTO != nil){
            genericCell.alarmStatus = self.alarmStatus
            genericCell.editAlarmDTO = self.editAlarmDTO
        }
        
        genericCell.myDictionary = cellsArray[indexPath.row] as? NSDictionary
        genericCell.tag = indexPath.row + 100
        if self.useDefaults == true{
            if ServicioViewController.defaultData != nil {
                genericCell.setDefaults(ServicioViewController.defaultData!,isCreate: true)
            }
        }
        if identificador == "AcceptButtonCell" || identificador == "DeleteButtonCell"{
            genericCell.buttonDelegate = self
        }
        if identificador == "ServiceAdviceCell"{
            genericCell.defaultDelegate = self
        }
        
        return genericCell
    }
    
    override func updateButtonPressed() {
        
        newAlarmEventDTO = EventDTO()
        newAlarmDTO = AlarmDTO()
        
        if self.alarmID != nil{
            newAlarmDTO!.alarmID = self.alarmID!
        }
        
        let insertCell = tabla!.viewWithTag(100) as! NewAlarmInsertTableViewCell
        if let alarmName = insertCell.nameTextField!.text{
            newAlarmEventDTO?.name = alarmName
            newAlarmEventDTO?.eventDescription = alarmName // preguntar este campo que onda
            
            // armar stamp con dia actual mas horario del picker
            setStamp(insertCell, newAlarmDTO: newAlarmDTO!)
            
        }
        setNewAlarmRepetitionDays(insertCell, newAlarmDTO: newAlarmDTO!, newAlarmEventDTO: newAlarmEventDTO!)
        
        let locationCell = tabla!.viewWithTag(101) as! LocationTableViewCell
        if let place = locationCell.locationTextField!.text{
            newAlarmDTO?.place = place
        }
        let serviceCell = tabla!.viewWithTag(103) as! ServicePickerTableViewCell
        if let service = serviceCell.service{
            newAlarmDTO?.service = service
        }
        
        let temperatureCell = tabla!.viewWithTag(104) as! SliderTableViewCell
        if let minTemp = temperatureCell.minValue{
            newAlarmDTO?.minTemp = minTemp
        }
        if let maxTemp = temperatureCell.maxValue{
            newAlarmDTO?.maxTemp = maxTemp
        }
        let windCell = tabla!.viewWithTag(105) as! SliderTableViewCell
        if let minWind = windCell.minValue{
            newAlarmDTO?.minWind = minWind
        }
        if let maxWind = windCell.maxValue{
            newAlarmDTO?.maxWind = maxWind
        }
        let humidityCell = tabla!.viewWithTag(106) as! SliderTableViewCell
        if let minHumidity = humidityCell.minValue{
            newAlarmDTO?.minHumidity = minHumidity
        }
        if let maxHumidity = humidityCell.maxValue{
            newAlarmDTO?.maxHumidity = maxHumidity
        }
        let snowCell = tabla!.viewWithTag(107) as! SliderTableViewCell
        if let minSnow = snowCell.minValue{
            newAlarmDTO?.minSnow = minSnow
        }
        if let maxSnow = snowCell.maxValue{
            newAlarmDTO?.maxSnow = maxSnow
        }
        
        let conditionCell = tabla!.viewWithTag(108) as! PickerTableViewCell
        if let condition = conditionCell.condition{
            newAlarmDTO?.condition = condition
        }
        
        let predictionCell = tabla!.viewWithTag(109) as! PredictionTableViewCell
        if let prediction = predictionCell.prediction{
            newAlarmDTO?.prediction = prediction
        }
        
        
        let alarmService : AlarmService = AlarmService()
        alarmService.editAlarm(dateTime: self.datetime! ,eventDTO: newAlarmEventDTO!, alarmDTO: newAlarmDTO!, token: UserService.currentUser.token,target: self,message: "editAlarmFinish:")
        
        
    }
    
    func editAlarmFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
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
    
    func setNewAlarmRepetitionDays(insertCell: NewAlarmInsertTableViewCell, newAlarmDTO : AlarmDTO, newAlarmEventDTO : EventDTO){
        
        if insertCell.daysButtonsView?.lunes?.dayButton?.selected == false {
            setRepetitionValue("1")
        }
        if insertCell.daysButtonsView?.martes?.dayButton?.selected == false {
            setRepetitionValue("2")
        }
        if insertCell.daysButtonsView?.miercoles?.dayButton?.selected == false {
            setRepetitionValue("3")
        }
        if insertCell.daysButtonsView?.jueves?.dayButton?.selected == false {
            setRepetitionValue("4")
        }
        if insertCell.daysButtonsView?.viernes?.dayButton?.selected == false {
            setRepetitionValue("5")
        }
        if insertCell.daysButtonsView?.sabado?.dayButton?.selected == false {
            setRepetitionValue("6")
        }
        if insertCell.daysButtonsView?.domingo?.dayButton?.selected == false {
            setRepetitionValue("7")
        }
    }
    
    func setRepetitionValue(day: String){
        if newAlarmEventDTO!.repetition == nil{
            newAlarmEventDTO!.repetition = ""
            newAlarmEventDTO!.repetition = (newAlarmEventDTO!.repetition)! + "\(day)"
        }else{
            newAlarmEventDTO!.repetition = (newAlarmEventDTO!.repetition)! + ",\(day)"
        }
        print(newAlarmEventDTO!.repetition)
    }
    
    func setStamp(insertCell: NewAlarmInsertTableViewCell, newAlarmDTO : AlarmDTO){
        
        let formatter = NSNumberFormatter()
        formatter.minimumIntegerDigits = 2
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar() //2015-11-24 17:00:49.0
        let components = calendar.components([ .Year, .Month, .Day], fromDate: date)
        let year = formatter.stringFromNumber(components.year)
        let month = formatter.stringFromNumber(components.month)
        let day = formatter.stringFromNumber(components.day)
        
        let timeLabel = insertCell.timeLabel!.text! as NSString
        
        
        let hour = timeLabel.substringWithRange(NSRange(location: 0, length: 2))
        let minute = timeLabel.substringWithRange(NSRange(location: 3, length: 2))
        
        //        dd-MM-yyyy-HH-mm-ss
        self.datetime = "\(day!)-\(month!)-\(year!)-\(hour)-\(minute)-00"
    }
    
    func defaultButtonPressed(){
        print("apretadooooooooooooo")
        
        self.useDefaults = true
        dispatch_async(dispatch_get_main_queue()) {
            
            self.tabla?.reloadData()
        }
        
    }
    
    func defaultButtonDisabled(){
        self.useDefaults = false
        
    }
    
    override func deleteButtonPressed() {
        newAlarmDTO = AlarmDTO()
        
        if self.alarmID != nil{
            newAlarmDTO!.alarmID = self.alarmID!
        }
        let alarmService : AlarmService = AlarmService()
        alarmService.deleteAlarm(alarmDTO: newAlarmDTO!, token: UserService.currentUser.token,target: self,message: "deleteAlarmFinish:")
    }
    
    func deleteAlarmFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        let alert = UIAlertController(title: "ELIMINAR", message: "Se ha eliminado la alarma", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  { (action: UIAlertAction!) in
            self.navigationController!.popToRootViewControllerAnimated(true)
        }))
        
        dispatch_async(dispatch_get_main_queue()) {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
}
