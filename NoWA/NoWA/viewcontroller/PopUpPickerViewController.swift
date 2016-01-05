//
//  PopUpPickerViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/30/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

protocol pickerDelegate {
    func pickerOptionSelected(selectedRow : Int) -> Void
}

class PopUpPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var delegate : pickerDelegate?
    
    var locationsPicker:NSMutableArray!
    
    var pickerContainerView : UIView?
    var cityPicker : UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("cancelAction"))
        self.view.addGestureRecognizer(tap)
        
        pickerContainerView = UIView()
        pickerContainerView?.backgroundColor = .ribbonAltColor()//.whiteColor()
        self.view.addSubview(pickerContainerView!)
        
        cityPicker = UIPickerView()
        cityPicker?.delegate = self
        cityPicker?.dataSource = self
        pickerContainerView!.addSubview(cityPicker!)
        
        let okButton = UIButton()
        okButton.backgroundColor = .whiteColor()
        okButton.setTitle("OK", forState: .Normal)
        okButton.setTitleColor(UIColor.blackColor(), forState:UIControlState.Normal)
        okButton.addTarget(self, action: "okPressed", forControlEvents: UIControlEvents.TouchUpInside)
        pickerContainerView!.addSubview(okButton)
        pickerContainerView?.bringSubviewToFront(okButton)
        
        pickerContainerView?.autoMatchDimension(ALDimension.Width, toDimension: ALDimension.Width, ofView: self.view)
        pickerContainerView?.autoSetDimension(ALDimension.Height, toSize: self.view.frame.size.height / 3.5)
        pickerContainerView?.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self.view)
        
        okButton.autoPinEdge(.Top, toEdge: .Top, ofView: pickerContainerView!)
        okButton.autoPinEdge(.Left, toEdge: .Left, ofView: pickerContainerView!)
        okButton.autoPinEdge(.Right, toEdge: .Right, ofView: pickerContainerView!)
        okButton.autoSetDimension(.Height, toSize: 40)
        
        cityPicker!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: pickerContainerView!)
        cityPicker!.autoPinEdge(.Left, toEdge: .Left, ofView: pickerContainerView!)
        cityPicker!.autoPinEdge(.Right, toEdge: .Right, ofView: pickerContainerView!)
        cityPicker!.autoPinEdge(.Top, toEdge: .Bottom, ofView: okButton)
        
    }
    
    func cancelAction () {
        
        UIView.animateWithDuration(0.35, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.view.alpha = 0
            }, completion: {
                (finished: Bool) -> Void in
                self.willMoveToParentViewController(nil)
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
        })
    }
    
    func okPressed() {
        
        let selectedRow = self.cityPicker!.selectedRowInComponent(0)
        
        self.delegate?.pickerOptionSelected(selectedRow)
        
        cancelAction()
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationsPicker.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (locationsPicker[row] as! String)
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: self.locationsPicker![row] as! String, attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        
        
        return attributedString
    }
    
}
