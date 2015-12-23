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
    var recoverButton : UIButton!
    var lineView : UIView!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        
        iconImage = UIImageView()
        iconImage.contentMode = UIViewContentMode.ScaleAspectFit
        self.addSubview(iconImage)
        
        inputTextField = UITextField()
        inputTextField.textColor = UIColor.whiteColor()
        inputTextField.keyboardType = UIKeyboardType.EmailAddress
        inputTextField.font = UIFont.appLatoFontOfSize(15)
        inputTextField.adjustsFontSizeToFitWidth = true
        
        self.addSubview(inputTextField)
        
        
        recoverButton = UIButton()
        recoverButton.backgroundColor = .clearColor()
        recoverButton.setTitle("RECUPERAR", forState: UIControlState.Normal)
        recoverButton.setTitleColor(.whiteColor(), forState: UIControlState.Normal)
        recoverButton.titleLabel!.font = UIFont.appLatoFontOfSize(15)
        recoverButton.titleLabel?.adjustsFontSizeToFitWidth = true
        recoverButton.addTarget(self, action: "recover", forControlEvents: UIControlEvents.TouchUpInside)
        recoverButton.hidden = true
        self.addSubview(recoverButton)
        
        lineView = UIView()
        lineView.backgroundColor = UIColor.whiteColor()
        self.addSubview(lineView)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func layoutSubviews() {
        
        iconImage.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self, withOffset: 10)
        iconImage.autoSetDimension(ALDimension.Width, toSize: 18)
        iconImage.autoSetDimension(ALDimension.Height, toSize: 18)
        iconImage.autoAlignAxis(ALAxis.Horizontal, toSameAxisOfView: self)
        
        
        if recoverButton.hidden == false {
            recoverButton.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self)
            recoverButton.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self)
            recoverButton.autoPinEdge(ALEdge.Bottom, toEdge: .Top, ofView: lineView)
            recoverButton.autoSetDimension(ALDimension.Width, toSize: self.frame.size.width / 4)
        }
        
        
        inputTextField.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self, withOffset: 40)
        if recoverButton.hidden == false {
            inputTextField.autoPinEdge(ALEdge.Right, toEdge: .Left, ofView: recoverButton)
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
        
        if let _icon = icon{
            iconImage.image = UIImage(named: _icon)
        }
        
        if let _placeholder = placeholder{
            inputTextField.attributedPlaceholder =  NSAttributedString(string:_placeholder,
                attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        }
        
        if recover == true{
            recoverButton.hidden = false
            
        } else {
            recoverButton.hidden = true
        }
        
        if secureMode == true{
            inputTextField.secureTextEntry = true
        }
    }
    
    func recover(){
        callService()
    }
    
    
    func callService () {
        let userService : UserService = UserService()
        userService.recover(inputTextField.text,target: self,message: "recoverFinish:")
    }
    
    func recoverFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
        let recoverCode:String = result.entityForKey("recover") as! String
        if recoverCode != "" {
            print(recoverCode)
        }
        
    }
    
}

