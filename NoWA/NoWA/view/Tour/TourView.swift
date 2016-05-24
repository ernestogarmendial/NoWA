//
//  TourView.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 11/30/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//


class TourView: UIView {
    
    var backgroundImage : UIImageView!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        backgroundImage = UIImageView()
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        self.addSubview(backgroundImage)
        
        backgroundImage.autoPinEdge(ALEdge.Top, toEdge: .Top, ofView: self)
        backgroundImage.autoPinEdge(ALEdge.Bottom, toEdge: .Bottom, ofView: self)
        backgroundImage.autoPinEdge(ALEdge.Left, toEdge: .Left, ofView: self)
        backgroundImage.autoPinEdge(ALEdge.Right, toEdge: .Right, ofView: self)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    func setBackground(){
        
        let lang =  NSLocale.preferredLanguages().first! as NSString
        let language = lang.substringWithRange(NSRange(location: 0, length: 2))
        
        if language == "en" {
            if self.tag == 100{
                backgroundImage.image = UIImage(named: "tour1_en")
            }else if self.tag == 101{
                backgroundImage.image = UIImage(named: "tour2_en")
            }else if self.tag == 102{
                backgroundImage.image = UIImage(named: "tour3_en")
            }
        } else if language == "es" {
            if self.tag == 100{
                backgroundImage.image = UIImage(named: "tour1")
            }else if self.tag == 101{
                backgroundImage.image = UIImage(named: "tour2")
            }else if self.tag == 102{
                backgroundImage.image = UIImage(named: "tour3")
            }
        }
        

        

    }
    
}
