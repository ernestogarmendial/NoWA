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
     
        self.title = "NO WakeAPP"
        
        self.view.backgroundColor = .redColor()
        
        UITabBar.appearance().barTintColor = UIColor.clearColor()        
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
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
