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

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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

}
