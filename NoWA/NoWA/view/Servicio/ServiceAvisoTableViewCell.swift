//
//  ServiceAvisoTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class ServiceAvisoTableViewCell: GenericTableViewCell {
    
    var cancelationView : UIView?
    var cancelationLabel : UILabel?
    var adviceLabel : UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .registroGrayColor()
        self.contentView.backgroundColor = .registroGrayColor()
        
        cancelationView = UIView()
        cancelationView?.backgroundColor = .ribbonAltColor()
        self.addSubview(cancelationView!)
        
        cancelationLabel = UILabel()
        cancelationLabel!.text = "Rango de Cancelación"
        cancelationLabel!.textColor = .whiteColor()
        cancelationLabel!.font = UIFont.appLatoFontOfSize(14)
        cancelationLabel!.adjustsFontSizeToFitWidth = true
        cancelationLabel!.textAlignment = .Left
        cancelationLabel!.numberOfLines = 1
        cancelationView!.addSubview(cancelationLabel!)
        
        adviceLabel = UILabel()
        adviceLabel!.text = "ATENCION! Cualquiera de estos parámetros definirán la cancelación de tus alarmas"
        adviceLabel!.textColor = .whiteColor()
        adviceLabel!.font = UIFont.appLatoFontOfSize(14)
        adviceLabel!.adjustsFontSizeToFitWidth = true
        adviceLabel!.textAlignment = .Center
        adviceLabel!.numberOfLines = 2
        self.addSubview(adviceLabel!)
        
       let myMutableString = NSMutableAttributedString(string: adviceLabel!.text!, attributes: [NSFontAttributeName:UIFont.appLatoFontOfSize(14)])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.loginRedColor(), range: NSRange(location:0,length:9))
        
        adviceLabel!.attributedText = myMutableString
        setupConstrains()
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setItems(myDictionary: NSDictionary) {
        
    }
    
    func setupConstrains(){
        
        cancelationView!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        cancelationView!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
        cancelationView!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        cancelationView!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        cancelationView!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.30)
        
        cancelationLabel!.autoPinEdge(.Left, toEdge: .Left, ofView: cancelationView!, withOffset: 20)
        cancelationLabel!.autoPinEdge(.Right, toEdge: .Right, ofView: cancelationView!)
        cancelationLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: cancelationView!)
        cancelationLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: cancelationView!)
        
        adviceLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: cancelationView!, withMultiplier: 0.8)
        adviceLabel?.autoAlignAxis(.Vertical, toSameAxisOfView: self)
        adviceLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        adviceLabel!.autoPinEdge(.Top, toEdge: .Bottom, ofView: cancelationView!)
        
    }
}
