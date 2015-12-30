//
//  ServicioTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ServicioTableViewController: GenericTableViewController {
    
    
    var cellsArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(ServicePickerTableViewCell.self, forCellReuseIdentifier: "ServicePicker")
        self.tableView.registerClass(PickerTableViewCell.self, forCellReuseIdentifier: "PickerCell")
        self.tableView.registerClass(ServiceAvisoTableViewCell.self, forCellReuseIdentifier: "ServiceAdviceCell")
        self.tableView.registerClass(SliderTableViewCell.self, forCellReuseIdentifier: "SliderCell")
        self.tableView.registerClass(PredictionTableViewCell.self, forCellReuseIdentifier: "PredictionSliderCell")
        self.tableView.registerClass(ButtonTableFooterView.self, forCellReuseIdentifier: "AcceptButtonCell")

        

        let path = NSBundle.mainBundle().pathForResource("ServicioTabCells", ofType: "plist")
        self.cellsArray = NSMutableArray(contentsOfFile: path!)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
    }
    
    func addAlarm(){
        print("add Alarm")
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
        
        let genericCell = tableView.dequeueReusableCellWithIdentifier(identificador, forIndexPath: indexPath) as! GenericTableViewCell
        
        genericCell.myDictionary = cellsArray[indexPath.row] as? NSDictionary
        //        let cellDitionary = cellsArray[indexPath.row] as! NSDictionary
        //        genericCell.setItems(cellDitionary)
        
        return genericCell
    }
    
//    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = ButtonTableFooterView()
//        
//        return footerView
//    }
//    
//    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 120
//    }
}
