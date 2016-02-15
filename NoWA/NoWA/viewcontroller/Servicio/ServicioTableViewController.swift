//
//  ServicioTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ServicioTableViewController: GenericTableViewController, ButtonFooterDelegate {
    
    var defaultWeatherDTO : AlarmDTO?
    var defaultDataDTO : AlarmDTO?
    
    var cellsArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(ServicePickerTableViewCell.self, forCellReuseIdentifier: "ServicePicker")
        self.tableView.registerClass(PickerTableViewCell.self, forCellReuseIdentifier: "PickerCell")
        self.tableView.registerClass(LocationTableViewCell.self, forCellReuseIdentifier: "LocationCell")
        self.tableView.registerClass(ServiceAvisoTableViewCell.self, forCellReuseIdentifier: "ServiceAdviceCell")
        self.tableView.registerClass(SliderTableViewCell.self, forCellReuseIdentifier: "SliderCell")
        self.tableView.registerClass(PredictionTableViewCell.self, forCellReuseIdentifier: "PredictionSliderCell")
        self.tableView.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "AcceptButtonCell")
        
        
        let path = NSBundle.mainBundle().pathForResource("ServicioTabCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
        getDefaults()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellsArray != nil{
            return cellsArray.count
        }else{
            return 0
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        let height = cellsArray[indexPath.row]["height"] as! CGFloat
        return height
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identificador = cellsArray[indexPath.row]["identifier"] as! String
        
        let genericCell = self.tableView.dequeueReusableCellWithIdentifier(identificador, forIndexPath: indexPath) as! GenericTableViewCell
        
        genericCell.myDictionary = cellsArray[indexPath.row] as? NSDictionary
        genericCell.tag = indexPath.row + 100
        
        if (self.defaultDataDTO != nil){
            genericCell.defaultDTO = self.defaultDataDTO
        }
        
        if identificador == "AcceptButtonCell"{
            genericCell.buttonDelegate = self
            
        }
        return genericCell
    }
    
    override func acceptButtonPressed() {
        print("delegado")
        
        setDefault()
        
    }
    
    func setDefault(){
        
        defaultWeatherDTO = AlarmDTO()
        
        let serviceCell = tableView.viewWithTag(100) as! ServicePickerTableViewCell
        if let service = serviceCell.service{
            defaultWeatherDTO?.service = service
        }
        let locationCell = tableView.viewWithTag(101) as! LocationTableViewCell
        if let place = locationCell.locationTextField!.text{//locationCell.place{
            defaultWeatherDTO?.place = place
        }
        let conditionCell = tableView.viewWithTag(103) as! PickerTableViewCell
        if let condition = conditionCell.condition{
            defaultWeatherDTO?.condition = condition
        }
        let temperatureCell = tableView.viewWithTag(104) as! SliderTableViewCell
        if let minTemp = temperatureCell.minValue{
            defaultWeatherDTO?.minTemp = minTemp
        }
        if let maxTemp = temperatureCell.maxValue{
            defaultWeatherDTO?.maxTemp = maxTemp
        }
        let windCell = tableView.viewWithTag(105) as! SliderTableViewCell
        if let minWind = windCell.minValue{
            defaultWeatherDTO?.minWind = minWind
        }
        if let maxWind = windCell.maxValue{
            defaultWeatherDTO?.maxWind = maxWind
        }
        let humidityCell = tableView.viewWithTag(106) as! SliderTableViewCell
        if let minHumidity = humidityCell.minValue{
            defaultWeatherDTO?.minHumidity = minHumidity
        }
        if let maxHumidity = humidityCell.maxValue{
            defaultWeatherDTO?.maxHumidity = maxHumidity
        }
        let snowCell = tableView.viewWithTag(107) as! SliderTableViewCell
        if let minSnow = snowCell.minValue{
            defaultWeatherDTO?.minSnow = minSnow
        }
        if let maxSnow = snowCell.maxValue{
            defaultWeatherDTO?.maxSnow = maxSnow
        }
        let predictionCell = tableView.viewWithTag(108) as! PredictionTableViewCell
        if let prediction = predictionCell.prediction{
            defaultWeatherDTO?.prediction = prediction
        }
        
        let weatherService : WeatherService = WeatherService()
        weatherService.setDefault( weatherDTO: defaultWeatherDTO, token: UserService.currentUser.token,target: self,message: "setDefaultFinish:")
        
    }
    
    func setDefaultFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        let alert = UIAlertController(title: "Servicio", message: "Se han guardado tus preferencias", preferredStyle: UIAlertControllerStyle.Alert)
        
        dispatch_async(dispatch_get_main_queue()) {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        let delay = 1 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func getDefaults(){
        let weatherService : WeatherService = WeatherService()
        weatherService.getDefault(token: UserService.currentUser.token,target: self,message: "getDefaultFinish:")
        
    }
    
    func getDefaultFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        self.defaultDataDTO = result.entityForKey("GetDefault") as? AlarmDTO
        
        dispatch_async(dispatch_get_main_queue()) {
            
            self.tableView.reloadData()
        }
    }
    
    override func adminButtonPressed(){
        print("pepe")
    }
    
    func deleteButtonPressed() {
        print("delete")
    }
    
    func updateButtonPressed() {
        print("update")
    }
    func saveButtonPressed() {
        print("save")
    }
}
