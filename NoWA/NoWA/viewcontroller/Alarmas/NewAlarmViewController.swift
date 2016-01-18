//
//  NewAlarmViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 14/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class NewAlarmViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource {
    
    var newAlarmDTO : AlarmDTO?
    var newAlarmEventDTO : EventDTO?
    
    var cellsArray: NSMutableArray!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .registroGrayColor()
        
        let image = UIImage(named: "create_alarm_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        
        self.tabla!.registerClass(NewAlarmInsertTableViewCell.self, forCellReuseIdentifier: "Insert")
        self.tabla!.registerClass(ServicePickerTableViewCell.self, forCellReuseIdentifier: "ServicePicker")
        self.tabla!.registerClass(PickerTableViewCell.self, forCellReuseIdentifier: "PickerCell")
        self.tabla!.registerClass(LocationTableViewCell.self, forCellReuseIdentifier: "LocationCell")
        self.tabla!.registerClass(ServiceAvisoTableViewCell.self, forCellReuseIdentifier: "ServiceAdviceCell")
        self.tabla!.registerClass(SliderTableViewCell.self, forCellReuseIdentifier: "SliderCell")
        self.tabla!.registerClass(PredictionTableViewCell.self, forCellReuseIdentifier: "PredictionSliderCell")
        self.tabla!.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "AcceptButtonCell")
        
        
        let path = NSBundle.mainBundle().pathForResource("NewAlarmCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
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
        
        genericCell.myDictionary = cellsArray[indexPath.row] as? NSDictionary
        genericCell.tag = indexPath.row + 100
        
        if identificador == "AcceptButtonCell"{
            genericCell.buttonDelegate = self
        }
        
        
        return genericCell
    }
    
    override func createButtonPressed() {
        print("new alarm view controller")
        
        newAlarmEventDTO = EventDTO()
        newAlarmDTO = AlarmDTO()
        
        let insertCell = tabla!.viewWithTag(100) as! NewAlarmInsertTableViewCell
        if let alarmName = insertCell.nameTextField!.text{
            newAlarmEventDTO?.name = alarmName
            newAlarmEventDTO?.eventDescription = alarmName // preguntar este campo que onda
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
        alarmService.createAlarm(eventDTO: newAlarmEventDTO!, alarmDTO: newAlarmDTO!, token: UserService.currentUser.token,target: self,message: "setDefaultFinish:")
        
        
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
    
}
