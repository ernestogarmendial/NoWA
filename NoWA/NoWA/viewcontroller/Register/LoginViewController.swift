//
//  LoginViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 21/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
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
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func startApp(){
        
        
        let tabBarController = MainTabBarController()
        
        let servicio = ServicioViewController()
        let alarmas = AlarmasViewController()
        let torneos = TorneosViewController()
        let perfil = PerfilViewController()
        let controllers = [servicio,alarmas,torneos,perfil]
        
        tabBarController.viewControllers = controllers
        
        let firstImage = UIImage(named: "cloud")?.imageWithRenderingMode(.AlwaysOriginal)
        let firstImage_sel = UIImage(named: "cloud_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        let secondImage = UIImage(named: "clock")?.imageWithRenderingMode(.AlwaysOriginal)
        let secondImage_sel = UIImage(named: "clock_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        let thirdImage = UIImage(named: "team")?.imageWithRenderingMode(.AlwaysOriginal)
        let thirdImage_sel = UIImage(named: "team_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        let fourthImage = UIImage(named: "equalizer")?.imageWithRenderingMode(.AlwaysOriginal)
        let fourthImage_sel = UIImage(named: "equalizer_selected")?.imageWithRenderingMode(.AlwaysOriginal)

        servicio.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Servicio", comment: ""),
            image: firstImage,
            selectedImage: firstImage_sel)
        alarmas.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Alarmas", comment: ""),
            image: secondImage,
            selectedImage: secondImage_sel)
        torneos.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Torneos", comment: ""),
            image: thirdImage,
            selectedImage: thirdImage_sel)
        perfil.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Perfil", comment: ""),
            image: fourthImage,
            selectedImage: fourthImage_sel)
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [tabBarController]
        
        switchRootViewController(navigationController, animated: true, completion: nil)
        
    }
    
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if animated {
            UIView.transitionWithView(UIApplication.sharedApplication().keyWindow!, duration: 0.5, options: .TransitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled()
                UIView.setAnimationsEnabled(false)
                UIApplication.sharedApplication().keyWindow?.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
                }, completion: { (finished: Bool) -> () in
                    if (completion != nil) {
                        completion!()
                    }
            })
        } else {
            UIApplication.sharedApplication().keyWindow?.rootViewController = rootViewController
        }
    }
    
}

