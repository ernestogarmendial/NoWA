//
//  ServiceLocationTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ServiceLocationTableViewCell: GenericTableViewCell {

    var titleLabel : UILabel?
    var descriptionLabel : UILabel?

    var leftIcon : UIImageView?
    var rightButton : UIButton?
    
    var titleString : String?
    var rightIconString : String?
    var leftIconString : String?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .servicePickerBlueColor()
        self.contentView.backgroundColor = .servicePickerBlueColor()
        
        titleLabel = UILabel()
        titleLabel!.text = "SERVICIO"
        titleLabel!.textColor = .whiteColor()
        titleLabel!.font = UIFont.appLatoFontOfSize(14)
        titleLabel!.adjustsFontSizeToFitWidth = true
        titleLabel!.textAlignment = .Center
        titleLabel!.numberOfLines = 1
        self.addSubview(titleLabel!)
        
        setupConstrains()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrains(){
        
  
    }
    

}
