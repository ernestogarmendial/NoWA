//
//  GenericViewController.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 17/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {

    
    var tabla : UITableView?
    var pictureView : UIImageView?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabla = UITableView()
        tabla!.backgroundColor = .clearColor()
        tabla!.tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0,height: self.tabBarController!.tabBar.frame.height))
        tabla!.separatorColor = .clearColor()
        self.view.addSubview(tabla!)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tabla!.addGestureRecognizer(tap)
        
        pictureView = UIImageView()
        self.view.addSubview(pictureView!)
        self.view.bringSubviewToFront(tabla!)
        
        pictureView?.autoPinEdge(.Top, toEdge: .Top, ofView: self.view)
        pictureView?.autoPinEdge(.Left, toEdge: .Left, ofView: self.view)
        pictureView?.autoPinEdge(.Right, toEdge: .Right, ofView: self.view)
        pictureView?.autoSetDimension(.Height, toSize: 170)
        
        tabla?.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self.view)
        tabla?.autoPinEdge(.Top, toEdge: .Top, ofView: self.view, withOffset: 64)
        tabla?.autoPinEdge(.Left, toEdge: .Left, ofView: self.view)
        tabla?.autoPinEdge(.Right, toEdge: .Right, ofView: self.view)

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
