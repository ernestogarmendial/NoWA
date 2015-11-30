//
//  ViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 29/11/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    var tourScrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .redColor()
        
        self.tourScrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        
        self.tourScrollView.delegate = self
        self.tourScrollView.pagingEnabled = true
        self.tourScrollView.contentSize = CGSizeMake(CGFloat(3*Int(tourScrollView.frame.size.width)), tourScrollView.frame.size.height-64)
        self.tourScrollView.clipsToBounds = false
        self.tourScrollView.showsHorizontalScrollIndicator = false
        self.tourScrollView.showsVerticalScrollIndicator = false

        for var i = 0; i < 3; i++ {
            
            let frame = CGRectMake(CGFloat(i*Int(tourScrollView.frame.size.width)), 0, tourScrollView.frame.size.width, tourScrollView.frame.size.height)
            
            
            let tourView = TourView(frame: frame)
            tourView.tag = 100+i
            tourView.setBackground()
//            tourView.delegate = self
//            tourView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
            self.tourScrollView.addSubview(tourView)
            
        }
        
        self.view.addSubview(self.tourScrollView)

        
        
        let boton = UIButton()
        boton.backgroundColor = .blueColor()
        boton.setTitle("Siguiente", forState: UIControlState.Normal)
        boton.layer.cornerRadius = 20
        self.view.addSubview(boton)
        
        boton.autoSetDimension(ALDimension.Height, toSize: 40)
        boton.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 30)
        boton.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -30)
        boton.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: self.view, withOffset: -30)


    }
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = true;
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.backgroundColor = .clearColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage();
//        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)
        
    }

}

