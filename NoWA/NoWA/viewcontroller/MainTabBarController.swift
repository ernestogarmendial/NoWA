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
        
        self.view.backgroundColor = .registroGrayColor()
        
        //        UITabBar.appearance().barTintColor = UIColor.registroGrayColor()
        UITabBar.appearance().barTintColor = UIColor.blackColor()
        
        
        let logoImage = UIImage(named:"logoNav")
        self.navigationItem.titleView = UIImageView(image: logoImage)
        
        // descomentar esto para que se haga transparente
        
        //        UITabBar.appearance().barTintColor = UIColor.clearColor()
        //        UITabBar.appearance().backgroundImage = UIImage()
        //        UITabBar.appearance().shadowImage = UIImage()
        //
        // descomentar esto para que se haga transparente
        
        
        self.tabBar.tintColor = UIColor.whiteColor()
        
    }

    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        UINavigationBar.appearance().hidden = false
        
        self.navigationController?.navigationBar.translucent = true;
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.backgroundColor = .clearColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage();
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont.appLatoFontOfSize(18)]
        
        for item in self.tabBar.items! {
            
            let unselectedItem: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            let selectedItem: NSDictionary = [NSForegroundColorAttributeName: UIColor.buttonSelectedRedColor()]
            item.setTitleTextAttributes(unselectedItem as? [String : AnyObject], forState: .Normal)
            item.setTitleTextAttributes(selectedItem as? [String : AnyObject], forState: .Selected)
            
        }
    }
}
