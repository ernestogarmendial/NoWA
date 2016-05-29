//
//  PictureTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 13/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PictureTableViewCell: GenericTableViewCell,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var circlePictureView : CirclePictureView?
    var nameLabel : UILabel?
    var leyendLabel : UITextField?
    var button: UIButton?
    var imagePicker = UIImagePickerController()

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clearColor()
        self.contentView.backgroundColor = .clearColor()

        circlePictureView = CirclePictureView()
        self.addSubview(circlePictureView!)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "buttonSelected")
        self.circlePictureView!.addGestureRecognizer(tap)
        
        nameLabel = UILabel()
        nameLabel!.textColor = .loginRedColor()
        nameLabel!.font = UIFont.appLatoFontOfSize(14)
        nameLabel!.adjustsFontSizeToFitWidth = true
        nameLabel!.textAlignment = .Center
        nameLabel!.numberOfLines = 1
        
        let username : String! = UserService.currentUser.username
        if  UserService.currentUser.role == 1{
            let adminText = "\(username) - Admin"
            let firstPart = username
            
            var myMutableString = NSMutableAttributedString()
            myMutableString = NSMutableAttributedString(
                string: adminText,
                attributes: [NSFontAttributeName:UIFont(
                    name: "Lato-Regular",
                    size: 16.0)!])
            myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor() , range: NSRange(location: 0, length: firstPart!.characters.count + 3))
            
            nameLabel?.attributedText = myMutableString
        }else{
            nameLabel?.text = username
        }
        
        self.addSubview(nameLabel!)
        
        leyendLabel = UITextField()
        leyendLabel?.delegate = self
        leyendLabel!.attributedPlaceholder =  NSAttributedString(string: NSLocalizedString("Ingresá tu frase personal!", comment: ""),
                                                                 attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        leyendLabel!.textColor = .whiteColor()
        leyendLabel!.font = UIFont.appLatoFontOfSize(16)
        leyendLabel!.adjustsFontSizeToFitWidth = true
        leyendLabel!.keyboardType = UIKeyboardType.Default
        leyendLabel!.clearButtonMode = .WhileEditing
        leyendLabel!.textAlignment = .Center
        self.addSubview(leyendLabel!)
        
        setupConstrains()
    }
    
    func buttonSelected() {
        print("apretado")
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            let currentController = self.getCurrentViewController()
            currentController?.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func getCurrentViewController() -> UIViewController? {
        
        if let rootController = UIApplication.sharedApplication().keyWindow?.rootViewController {
            var currentController: UIViewController! = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController
            }
            return currentController
        }
        return nil
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        
        circlePictureView?.autoAlignAxis(.Vertical, toSameAxisOfView: self)
        circlePictureView?.autoPinEdge(.Top, toEdge: .Top, ofView: self, withOffset: 20)
        
        nameLabel?.autoPinEdge(.Top, toEdge: .Bottom, ofView: circlePictureView!, withOffset: 20)
        nameLabel?.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        nameLabel?.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        
        leyendLabel?.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameLabel!, withOffset: 20)
        leyendLabel?.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        leyendLabel?.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        let currentController = self.getCurrentViewController()
        currentController?.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })

        self.circlePictureView?.picture?.image = image
        //Save image

        let data = UIImagePNGRepresentation(image)
        let defaultImageKey = "\(UserService.currentUser!.username!)ImageKey"
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: defaultImageKey)//"myImageKey")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}
