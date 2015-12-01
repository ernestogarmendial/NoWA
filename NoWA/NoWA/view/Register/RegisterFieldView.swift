//
//  RegisterFieldView.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/1/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

class RegisterFieldView: UIView {

    var iconImage : UIImageView!
    var registerTextField : UITextField!
    var recoverlabel : UILabel!
    var lineView : UIView!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        recoverlabel = UILabel()
        recoverlabel.textColor = UIColor.blackColor()
        recoverlabel.backgroundColor = UIColor.yellowColor()
        recoverlabel.font = UIFont(name: "HelveticaNeue", size: 15)
        recoverlabel.adjustsFontSizeToFitWidth = true
        recoverlabel.numberOfLines = 1
        recoverlabel.text = "prueba"
        self.addSubview(recoverlabel)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    func setupConstrains(){
        recoverlabel.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self, withOffset: 40)
        recoverlabel.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self, withOffset: 10)
        recoverlabel.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self)
        recoverlabel.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: self)

    }
    
    func setItems(){
        
    }
    
}
