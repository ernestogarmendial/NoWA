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

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
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
        
        
        callService()
        
        
        let tabBarController = MainTabBarController()
        
        let servicio = ServicioViewController()//ServicioTableViewController()
        let alarmas = AlarmasTableViewController()
        let torneos = TorneosTableViewController()
        let perfil = PerfilTableViewController()
        let controllers = [servicio,alarmas,torneos,perfil]
        
        tabBarController.viewControllers = controllers
        
        let firstImage = UIImage(named: "cloud")?.imageWithRenderingMode(.AlwaysOriginal)
        let secondImage = UIImage(named: "equalizer")?.imageWithRenderingMode(.AlwaysOriginal)
        let thirdImage = UIImage(named: "clock")?.imageWithRenderingMode(.AlwaysOriginal)
        let fourthImage = UIImage(named: "team")?.imageWithRenderingMode(.AlwaysOriginal)

        
        servicio.tabBarItem = UITabBarItem(
            title: "Servicio",
            image: firstImage,
            selectedImage: firstImage)
        alarmas.tabBarItem = UITabBarItem(
            title: "Alarmas",
            image: secondImage,
            selectedImage: secondImage)
        torneos.tabBarItem = UITabBarItem(
            title: "Torneos",
            image: thirdImage,
            selectedImage: thirdImage)
        perfil.tabBarItem = UITabBarItem(
            title: "Perfil",
            image: fourthImage,
            selectedImage: fourthImage)
        
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
    
    func callService () {
        let loginService : LoginService = LoginService()
        loginService.login(target: self,message: "loginFinish:")        
    }
    
    func loginFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
    }
}
