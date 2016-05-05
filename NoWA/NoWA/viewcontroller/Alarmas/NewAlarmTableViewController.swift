//
//  NewAlarmTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 14/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class NewAlarmTableViewController: UITableViewController {
    
    var cellsArray: NSMutableArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .darkGrayCustomColor()
        self.tableView.separatorColor = .clearColor()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.tableView.addGestureRecognizer(tap)
        
        self.tableView.registerClass(NewAlarmInsertTableViewCell.self, forCellReuseIdentifier: "Insert")
        self.tableView.registerClass(ServicePickerTableViewCell.self, forCellReuseIdentifier: "ServicePicker")
        self.tableView.registerClass(RingtoneTableViewCell.self, forCellReuseIdentifier: "RingtoneCell")
        self.tableView.registerClass(PickerTableViewCell.self, forCellReuseIdentifier: "PickerCell")
        self.tableView.registerClass(LocationTableViewCell.self, forCellReuseIdentifier: "LocationCell")
        self.tableView.registerClass(ServiceAvisoTableViewCell.self, forCellReuseIdentifier: "ServiceAdviceCell")
        self.tableView.registerClass(SliderTableViewCell.self, forCellReuseIdentifier: "SliderCell")
        self.tableView.registerClass(PredictionTableViewCell.self, forCellReuseIdentifier: "PredictionSliderCell")
        self.tableView.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "AcceptButtonCell")
        
        
        let path = NSBundle.mainBundle().pathForResource("NewAlarmCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
    }
    
    
    func dismissKeyboard() {
        self.tableView.endEditing(true)
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
        

        return genericCell
    }
    

    
    
    
}
