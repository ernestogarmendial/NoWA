//
//  AddressTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 13/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AddressTableViewCell: GenericTableViewCell {
    
    var leftIcon : UIImageView?
    var addressTextField : UITextField?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .serviceLocationColor()
        self.contentView.backgroundColor = .serviceLocationColor()
        
        leftIcon = UIImageView()
        leftIcon!.contentMode = UIViewContentMode.Center
        self.addSubview(leftIcon!)
        
        
        addressTextField = UITextField()
        addressTextField!.delegate = self
        addressTextField!.textColor = .whiteColor()
        addressTextField!.font = UIFont.appLatoFontOfSize(14)
        addressTextField!.adjustsFontSizeToFitWidth = true
        addressTextField!.keyboardType = UIKeyboardType.Default
        addressTextField!.clearButtonMode = .WhileEditing
        addressTextField!.textAlignment = .Left
        self.addSubview(addressTextField!)
        
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setItems(myDictionary: NSDictionary) {
        if let icon = myDictionary["icon"] as? String{
            leftIcon!.image = UIImage(named: icon)
            
            if icon == "envelope"{
                addressTextField?.enabled = false
                let email = NSUserDefaults.standardUserDefaults().valueForKey("email") as! String
                addressTextField?.text = email
            }
        }
        if let addressText = myDictionary["text"] as? String{
            addressTextField!.attributedPlaceholder =  NSAttributedString(string: addressText,
                attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        }
        if let boldText = myDictionary["bold_text"] as? String{
            //                titleLabel!.text = title
        }
    }
    
    
    //    func textFieldShouldReturn(textField: UITextField) -> Bool {
    //
    //        textField.resignFirstResponder()
    //        setupConstrains()
    //        return true
    //    }
    
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        super.textFieldShouldReturn(textField)
        setupConstrains()
        return true
    }
    
    func setupConstrains(){
        
        leftIcon?.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        leftIcon?.autoSetDimension(.Height, toSize: 20)
        leftIcon?.autoSetDimension(.Width, toSize: 20)
        leftIcon?.autoPinEdge(.Left, toEdge: .Left, ofView: self, withOffset: 40)
        
        addressTextField?.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        addressTextField?.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!, withOffset: 30)
        addressTextField?.autoPinEdge(.Right, toEdge: .Right, ofView: self, withOffset: 20)
        addressTextField?.autoSetDimension(.Height, toSize: 20)
 
    }
}
