//
//  MainTabBarController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/2/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.title = "NOWAKEAPP"
        
        self.view.backgroundColor = .registroGrayColor()
       
//        UITabBar.appearance().barTintColor = UIColor.registroGrayColor()
        
        // descomentar esto para que se haga transparente
        
        UITabBar.appearance().barTintColor = UIColor.clearColor()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
//
        // descomentar esto para que se haga transparente
        
        
        self.tabBar.tintColor = UIColor.whiteColor()//UIColor.buttonSelectedRedColor()

//        UITabBarItem.appearance().setTitleTextAttributes({NSForegroundColorAttributeName: UIColor.blackColor()}, forState:.Selected)
//        UITabBarItem.appearance().setTitleTextAttributes({NSForegroundColorAttributeName: UIColor.whiteColor()}, forState:.Normal)
        
//        let addAlarmButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addAlarm")
//        self.navigationItem.rightBarButtonItem = addAlarmButton
    }
    

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().hidden = false

        self.navigationController?.navigationBar.translucent = false;
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.backgroundColor = .clearColor()
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = nil;
        
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont.appLatoFontOfSize(18)]
        
    }
}
