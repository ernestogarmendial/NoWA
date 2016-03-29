//
//  WebProfileTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 18/3/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

protocol WebButtonDelegate {
    func webButtonPressed(url: String) -> Void
}
class WebProfileTableViewCell: GenericTableViewCell {
    
    var webButton : TTPopButton?
    var url : String?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .serviceLocationColor()
        self.contentView.backgroundColor = .serviceLocationColor()
        
        
        webButton = TTPopButton()
        webButton!.backgroundColor = .clearColor()
        webButton!.titleLabel!.font = UIFont.appLatoFontOfSize(15)
        self.addSubview(webButton!)
        
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setItems(myDictionary: NSDictionary) {
        
        let language = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode)! as! String
        
        if language == "en" {
            if let addressText = myDictionary["text_en"] as? String{
                webButton!.setTitle(addressText, forState: UIControlState.Normal)
                
                if addressText == "TERMS AND CONDITIONS"{
                    webButton!.addTarget(self, action: "goToTerms", forControlEvents: UIControlEvents.TouchUpInside)
                }
                if addressText == "SUPPORT"{
                    webButton!.addTarget(self, action: "goToSup", forControlEvents: UIControlEvents.TouchUpInside)
                }
                if addressText == "ABOUT NWA"{
                    webButton!.addTarget(self, action: "goToAbout", forControlEvents: UIControlEvents.TouchUpInside)
                }
            }
        }else if language == "es" {
            
            if let addressText = myDictionary["text"] as? String{
                webButton!.setTitle(addressText, forState: UIControlState.Normal)
                
                if addressText == "TÉRMINOS Y CONDICIONES"{
                    webButton!.addTarget(self, action: "goToTerms", forControlEvents: UIControlEvents.TouchUpInside)
                }
                if addressText == "SOPORTE"{
                    webButton!.addTarget(self, action: "goToSup", forControlEvents: UIControlEvents.TouchUpInside)
                }
                if addressText == "ACERCA DE NWA"{
                    webButton!.addTarget(self, action: "goToAbout", forControlEvents: UIControlEvents.TouchUpInside)
                }
            }
        }
    }
    
    func goToTerms() {
        self.webDelegate?.webButtonPressed(NSLocalizedString("http://nowakeapp.com/terminos.html", comment: ""))
    }
    func goToSup() {
        //        self.webDelegate?.webButtonPressed(self.url!)
    }
    func goToAbout() {
        //        self.webDelegate?.webButtonPressed(self.url!)
    }
    
    
    func setupConstrains(){
        
        webButton!.autoAlignAxis(ALAxis.Vertical, toSameAxisOfView: self)
        webButton!.autoAlignAxis(ALAxis.Horizontal, toSameAxisOfView: self)
        webButton!.autoSetDimension(ALDimension.Height, toSize: 40)
        webButton!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.7)
        
    }
}
