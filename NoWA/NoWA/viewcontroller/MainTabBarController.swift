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
        
        
//        UITabBar.appearance().barTintColor = UIColor.clearColor()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()

        self.tabBar.tintColor = UIColor.buttonSelectedRedColor()

    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = true;
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.hidden = false
        
        self.navigationController?.navigationBar.backgroundColor = .clearColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage();
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont.appLatoFontOfSize(18)]
    }
    
}
