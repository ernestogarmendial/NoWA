//
//  AddressTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 13/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class AddressTableViewCell: GenericTableViewCell, UITextFieldDelegate {
    
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
        addressTextField!.textAlignment = .Center
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
        }
        if let addressText = myDictionary["text"] as? String{
            addressTextField!.attributedPlaceholder =  NSAttributedString(string: addressText,
                attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        }
        if let boldText = myDictionary["bold_text"] as? String{
            //                titleLabel!.text = title
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        setupConstrains()
        return true
    }
    
    func setupConstrains(){
        
        addressTextField?.autoCenterInSuperview()
        
        leftIcon?.autoSetDimension(.Height, toSize: 20)
        leftIcon?.autoSetDimension(.Width, toSize: 20)
        leftIcon?.autoAlignAxis(.Horizontal, toSameAxisOfView: addressTextField!)
        leftIcon?.autoPinEdge(.Right, toEdge: .Left, ofView: addressTextField!, withOffset: -10)
        
        
        
    }
}
