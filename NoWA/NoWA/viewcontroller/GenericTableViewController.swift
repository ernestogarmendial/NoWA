//
//  GenericTableViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class GenericTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = .darkGrayCustomColor()

        self.tableView.tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: self.tabBarController!.tabBar.frame.height))

        self.tableView.separatorColor = .clearColor()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.tableView.addGestureRecognizer(tap)
        

    }

    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.tableView.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
    }


//    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let imageFooterView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 125))
//        
//        imageFooterView.backgroundColor = UIColor.darkGrayCustomColor()
//        
//        let bg = UIImageView(image: UIImage(named: "torneos_background"))
//        imageFooterView.addSubview(bg)
//        
//        bg.autoPinEdge(.Left, toEdge: .Left, ofView: imageFooterView)
//        bg.autoPinEdge(.Right, toEdge: .Right, ofView: imageFooterView)
//        bg.autoPinEdge(.Top, toEdge: .Top, ofView: imageFooterView)
//        bg.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: imageFooterView)
//
//        return imageFooterView
//    }
//    
//    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 125
//    }

    
    func adminButtonPressed(){
        print("admin")

    }
    
    func acceptButtonPressed() {
        
        print("accept")
    }
    
    func createButtonPressed() {
        print("create")
    }
    
}
