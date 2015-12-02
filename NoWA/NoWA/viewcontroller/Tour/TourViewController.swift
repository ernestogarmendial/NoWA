//
//  TourViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 29/11/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class TourViewController: UIViewController,UIScrollViewDelegate {
    
    var tourScrollView:UIScrollView!
    var nextButton : UIButton!
    var page : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .redColor()
        
        self.page = 0
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.tourScrollView = UIScrollView(frame: self.view.bounds)//CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        self.tourScrollView.delegate = self
        self.tourScrollView.pagingEnabled = true
        self.tourScrollView.contentSize = CGSizeMake(CGFloat(3*Int(tourScrollView.frame.size.width)), tourScrollView.frame.size.height)//-64)
        self.tourScrollView.showsHorizontalScrollIndicator = false
        self.tourScrollView.showsVerticalScrollIndicator = false
        self.tourScrollView.scrollEnabled = false
        
        for var i = 0; i < 3; i++ {
            
            let frame = CGRectMake(CGFloat(i*Int(tourScrollView.frame.size.width)), 0, tourScrollView.frame.size.width, tourScrollView.frame.size.height)
            
            let tourView = TourView(frame: frame)
            tourView.tag = 100+i
            tourView.setBackground()
            tourView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
            tourView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
            self.tourScrollView.addSubview(tourView)
            
        }
        
        self.view.addSubview(self.tourScrollView)
        
        nextButton = UIButton()
        nextButton.backgroundColor = .tourBlueColor()
        nextButton.setTitle("Siguiente", forState: UIControlState.Normal)
        nextButton.addTarget(self, action: "goNextPage", forControlEvents: UIControlEvents.TouchUpInside)
        nextButton.layer.cornerRadius = 25
        self.view.addSubview(nextButton)
        
        setupConstrains()
        
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func goNextPage(){
        
        let scrollViewFrame = CGRectMake(CGFloat((page+1)*Int(tourScrollView.frame.size.width)), 0, tourScrollView.frame.size.width, tourScrollView.frame.size.height)
        
        page = page+1
        tourScrollView.scrollRectToVisible(scrollViewFrame, animated: true)
        
        if page == 2{
            nextButton.setTitle("Ingresá", forState: UIControlState.Normal)
            nextButton.addTarget(self, action: "goToRegister", forControlEvents: UIControlEvents.TouchUpInside)
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = true;
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.hidden = true
        
        self.navigationController?.navigationBar.backgroundColor = .clearColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage();
    }
    
    func setupConstrains(){
        nextButton.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self.view)
        nextButton.autoSetDimension(ALDimension.Height, toSize: 50)
        nextButton.autoSetDimension(ALDimension.Width, toSize: self.view.frame.width * 0.7)
        nextButton.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: self.view, withOffset: -40)
    }
    
    func goToRegister(){
        let registerViewController = RegisterViewController()
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [registerViewController]
        
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

