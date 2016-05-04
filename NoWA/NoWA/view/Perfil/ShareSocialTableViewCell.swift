//
//  ShareSocialTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 3/5/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

protocol ShareSocialTableViewCellDelegate {
    func shareFb()
    func shareTwitter()
    func shareInstagram()
}

class ShareSocialTableViewCell: GenericTableViewCell {
    
    var fbButton : TTPopButton?
    var twitterButton : TTPopButton?
    var instagramButton : TTPopButton?
    var titleLabel : UILabel?

    var url : String?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .serviceLocationColor()
        self.contentView.backgroundColor = .serviceLocationColor()
        
        titleLabel = UILabel()
        titleLabel!.textColor = .whiteColor()
        titleLabel!.font = UIFont.appLatoFontOfSize(14)
        titleLabel!.adjustsFontSizeToFitWidth = true
        titleLabel!.textAlignment = .Center
        titleLabel!.numberOfLines = 1
        titleLabel!.text = NSLocalizedString("Compartí en tus redes", comment: "")
        self.addSubview(titleLabel!)
        
        fbButton = TTPopButton()
        fbButton!.backgroundColor = .clearColor()
        fbButton!.setImage(UIImage(named: "facebook_ico"), forState: UIControlState.Normal)
        fbButton!.addTarget(self, action: "fbPressed", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(fbButton!)
        
        twitterButton = TTPopButton()
        twitterButton!.backgroundColor = .clearColor()
        twitterButton!.setImage(UIImage(named: "twitter_ico"), forState: UIControlState.Normal)
        twitterButton!.addTarget(self, action: "twitterPressed", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(twitterButton!)
        
        instagramButton = TTPopButton()
        instagramButton!.backgroundColor = .clearColor()
        instagramButton!.setImage(UIImage(named: "instagram_ico"), forState: UIControlState.Normal)
        instagramButton!.addTarget(self, action: "instagramPressed", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(instagramButton!)
        instagramButton?.hidden = true
        
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func fbPressed() {

        self.shareDelegate?.shareFb()

    }
    func twitterPressed() {
        self.shareDelegate?.shareTwitter()
    }
    func instagramPressed() {
        self.shareDelegate?.shareInstagram()
    }
    
    
    func setupConstrains(){
        
        instagramButton?.autoAlignAxis(.Vertical, toSameAxisOfView: self)
        instagramButton?.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self, withOffset: -10)
        instagramButton?.autoSetDimension(.Height, toSize: 20)
        instagramButton?.autoSetDimension(.Width, toSize: 20)
        
        fbButton?.autoAlignAxis(.Horizontal, toSameAxisOfView: instagramButton!)
        fbButton?.autoPinEdge(.Right, toEdge: .Left, ofView: instagramButton!, withOffset: -20)//-40)
        fbButton?.autoSetDimension(.Height, toSize: 20)
        fbButton?.autoSetDimension(.Width, toSize: 20)
        
        twitterButton?.autoAlignAxis(.Horizontal, toSameAxisOfView: instagramButton!)
        twitterButton?.autoPinEdge(.Left, toEdge: .Right, ofView: instagramButton!, withOffset: 20)//40)
        twitterButton?.autoSetDimension(.Height, toSize: 20)
        twitterButton?.autoSetDimension(.Width, toSize: 20)
        
        titleLabel?.autoPinEdge(.Bottom, toEdge: .Top, ofView: instagramButton!, withOffset: -20)
        titleLabel?.autoAlignAxis(.Vertical, toSameAxisOfView: self)
        
        
    }
}
