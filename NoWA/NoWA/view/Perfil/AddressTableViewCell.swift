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
    var addressLabel : UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .registroGrayColor()
        self.contentView.backgroundColor = .registroGrayColor()
        
        leftIcon = UIImageView()
        leftIcon!.contentMode = UIViewContentMode.Center
        self.addSubview(leftIcon!)
        
        addressLabel = UILabel()
//        addressLabel!.text = "emaildeprueba@gmail.com"
        addressLabel!.textColor = .whiteColor()
        addressLabel!.font = UIFont.appLatoFontOfSize(14)
        addressLabel!.adjustsFontSizeToFitWidth = true
        addressLabel!.textAlignment = .Center
        addressLabel!.numberOfLines = 1
        self.addSubview(addressLabel!)
        
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
                addressLabel!.text = addressText
            }
            if let boldText = myDictionary["bold_text"] as? String{
//                titleLabel!.text = title
            }
        }
    
    
    func setupConstrains(){
        
        addressLabel?.autoCenterInSuperview()
        
        leftIcon?.autoSetDimension(.Height, toSize: 20)
        leftIcon?.autoSetDimension(.Width, toSize: 20)
        leftIcon?.autoAlignAxis(.Horizontal, toSameAxisOfView: addressLabel!)
        leftIcon?.autoPinEdge(.Right, toEdge: .Left, ofView: addressLabel!, withOffset: -10)

        
        
    }
}
