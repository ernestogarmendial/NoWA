//
//  ServicioViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ServicioViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource, ButtonFooterDelegate {
    var defaultWeatherDTO : AlarmDTO?
    var defaultDataDTO : AlarmDTO?
    
    var cellsArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .registroGrayColor()

        let image = UIImage(named: "torneos_background")
        pictureView?.image = image
        
        tabla?.delegate = self
        tabla?.dataSource = self
        tabla!.tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: self.tabBarController!.tabBar.frame.height))

        self.tabla!.registerClass(ServicePickerTableViewCell.self, forCellReuseIdentifier: "ServicePicker")
        self.tabla!.registerClass(PickerTableViewCell.self, forCellReuseIdentifier: "PickerCell")
        self.tabla!.registerClass(LocationTableViewCell.self, forCellReuseIdentifier: "LocationCell")
        self.tabla!.registerClass(ServiceAvisoTableViewCell.self, forCellReuseIdentifier: "ServiceAdviceCell")
        self.tabla!.registerClass(SliderTableViewCell.self, forCellReuseIdentifier: "SliderCell")
        self.tabla!.registerClass(PredictionTableViewCell.self, forCellReuseIdentifier: "PredictionSliderCell")
        self.tabla!.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "AcceptButtonCell")
        


        let path = NSBundle.mainBundle().pathForResource("ServicioTabCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
        getDefaults()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
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
        
        if (self.defaultDataDTO != nil){
            genericCell.defaultDTO = self.defaultDataDTO
        }
        
        if identificador == "AcceptButtonCell"{
            genericCell.buttonDelegate = self
            
        }
        return genericCell
    }
    
    func acceptButtonPressed() {
        print("delegado")
        
        setDefault()
        
    }
    
    func setDefault(){
        
        defaultWeatherDTO = AlarmDTO()
        
        let serviceCell = tabla!.viewWithTag(100) as! ServicePickerTableViewCell
        if let service = serviceCell.service{
            defaultWeatherDTO?.service = service
        }
        let locationCell = tabla!.viewWithTag(101) as! LocationTableViewCell
        if let place = locationCell.locationTextField!.text{//locationCell.place{
            defaultWeatherDTO?.place = place
        }
        let conditionCell = tabla!.viewWithTag(103) as! PickerTableViewCell
        if let condition = conditionCell.condition{
            defaultWeatherDTO?.condition = condition
        }
        let temperatureCell = tabla!.viewWithTag(104) as! SliderTableViewCell
        if let minTemp = temperatureCell.minValue{
            defaultWeatherDTO?.minTemp = minTemp
        }
        if let maxTemp = temperatureCell.maxValue{
            defaultWeatherDTO?.maxTemp = maxTemp
        }
        let windCell = tabla!.viewWithTag(105) as! SliderTableViewCell
        if let minWind = windCell.minValue{
            defaultWeatherDTO?.minWind = minWind
        }
        if let maxWind = windCell.maxValue{
            defaultWeatherDTO?.maxWind = maxWind
        }
        let humidityCell = tabla!.viewWithTag(106) as! SliderTableViewCell
        if let minHumidity = humidityCell.minValue{
            defaultWeatherDTO?.minHumidity = minHumidity
        }
        if let maxHumidity = humidityCell.maxValue{
            defaultWeatherDTO?.maxHumidity = maxHumidity
        }
        let snowCell = tabla!.viewWithTag(107) as! SliderTableViewCell
        if let minSnow = snowCell.minValue{
            defaultWeatherDTO?.minSnow = minSnow
        }
        if let maxSnow = snowCell.maxValue{
            defaultWeatherDTO?.maxSnow = maxSnow
        }
        let predictionCell = tabla!.viewWithTag(108) as! PredictionTableViewCell
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
        
        self.tabla!.reloadData()
    }
    
    func adminButtonPressed(){
        print("pepe")
    }
    
}
