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
    var boton : UIButton!
    var page : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .redColor()
        
        self.page = 0
        
        self.tourScrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        
        self.tourScrollView.delegate = self
        self.tourScrollView.pagingEnabled = true
        self.tourScrollView.contentSize = CGSizeMake(CGFloat(3*Int(tourScrollView.frame.size.width)), tourScrollView.frame.size.height-64)
        self.tourScrollView.clipsToBounds = false
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
        
        
        
        boton = UIButton()
        boton.backgroundColor = .blueColor()
        boton.setTitle("Siguiente", forState: UIControlState.Normal)
        boton.addTarget(self, action: "goNextPage", forControlEvents: UIControlEvents.TouchUpInside)
        boton.layer.cornerRadius = 20
        self.view.addSubview(boton)
        
        setupConstrains()
        
    }
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    //    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    //
    //        self.page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    //
    //        print("pagina \(page)")
    //    }
    
    func goNextPage(){
        
        let scrollViewFrame = CGRectMake(CGFloat((page+1)*Int(tourScrollView.frame.size.width)), 0, tourScrollView.frame.size.width, tourScrollView.frame.size.height)
        
        page = page+1
        tourScrollView.scrollRectToVisible(scrollViewFrame, animated: true)
        
        if page == 2{
            boton.setTitle("Ingresá", forState: UIControlState.Normal)
            boton.addTarget(self, action: "goToRegister", forControlEvents: UIControlEvents.TouchUpInside)
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
        boton.autoSetDimension(ALDimension.Height, toSize: 40)
        boton.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self.view, withOffset: 40)
        boton.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self.view, withOffset: -40)
        boton.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: self.view, withOffset: -30)
    }
    
}

