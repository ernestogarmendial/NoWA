//
//  NewAlarmViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 14/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class NewAlarmViewController: GenericViewController, UITableViewDelegate, UITableViewDataSource {

    
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
        
        
        return genericCell
    }
    
    
    
    
    
}
