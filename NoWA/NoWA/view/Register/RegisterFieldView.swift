//
//  RegisterFieldView.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/1/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

class RegisterFieldView: UIView {
    
    var iconImage : UIImageView!
    var inputTextField : UITextField!
    var recoverlabel : UILabel!
    var lineView : UIView!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        inputTextField = UITextField()
        inputTextField.textColor = UIColor.whiteColor()
        inputTextField.backgroundColor = UIColor.blueColor()
        inputTextField.adjustsFontSizeToFitWidth = true
        
        self.addSubview(inputTextField)
        
        recoverlabel = UILabel()
        recoverlabel.textColor = UIColor.whiteColor()
        recoverlabel.backgroundColor = UIColor.yellowColor()
        recoverlabel.font = UIFont(name: "HelveticaNeue", size: 12)
        recoverlabel.adjustsFontSizeToFitWidth = true
        recoverlabel.numberOfLines = 1
        recoverlabel.text = "RECUPERAR"
        recoverlabel.hidden = true
        self.addSubview(recoverlabel)
        
        lineView = UIView()
        lineView.backgroundColor = UIColor.whiteColor()
        self.addSubview(lineView)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func layoutSubviews() {
        
        
        inputTextField.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self, withOffset: 40)
        inputTextField.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self)
        inputTextField.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: lineView)
        
        recoverlabel.autoPinEdge(ALEdge.Left, toEdge: .Right, ofView: inputTextField)
        recoverlabel.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self)
        recoverlabel.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self)
        recoverlabel.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: lineView)
        recoverlabel.autoSetDimension(ALDimension.Width, toSize: self.frame.size.width / 3.5)
        
        lineView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self)
        lineView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self)
        lineView.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: self)
        lineView.autoSetDimension(ALDimension.Height, toSize: 1.5)
        
        
    }
    
    func setItems(icon: String?, placeholder: String?, recover: Bool, secureMode: Bool){
        
        //        if let _icon = icon{
        //
        //        }
        
        if let _placeholder = placeholder{
            inputTextField.attributedPlaceholder =  NSAttributedString(string:_placeholder,
                attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        }
        
        if recover == true{
            recoverlabel.hidden = false
        }
        
        if secureMode == true{
            inputTextField.secureTextEntry = true
        }
    }
    
}
