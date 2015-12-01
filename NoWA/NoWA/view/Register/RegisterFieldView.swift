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
        recoverlabel.text = "RECUPERAR"
        recoverlabel.adjustsFontSizeToFitWidth = true
        recoverlabel.numberOfLines = 1
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
        
        if recoverlabel.hidden == false {
            recoverlabel.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self)
            recoverlabel.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self)
            recoverlabel.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: lineView)
            recoverlabel.autoSetDimension(ALDimension.Width, toSize: self.frame.size.width / 4)
        }
        
        inputTextField.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self, withOffset: 40)
        if recoverlabel.hidden == false {
            inputTextField.autoPinEdge(ALEdge.Right, toEdge: .Left, ofView: recoverlabel)
        }else{
            inputTextField.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self)
        }
        inputTextField.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self)
        inputTextField.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: lineView)
        
        lineView.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self)
        lineView.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self)
        lineView.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: self)
        lineView.autoSetDimension(ALDimension.Height, toSize: 1)
        
        
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
            
        } else {
            recoverlabel.hidden = true
        }
        
        if secureMode == true{
            inputTextField.secureTextEntry = true
        }
    }
    
}
