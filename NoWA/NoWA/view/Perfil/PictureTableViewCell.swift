//
//  PictureTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 13/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PictureTableViewCell: GenericTableViewCell {

    var circlePictureView : CirclePictureView?
    var nameLabel : UILabel?
    var leyendLabel : UITextField?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clearColor()
        self.contentView.backgroundColor = .clearColor()

        circlePictureView = CirclePictureView()
        self.addSubview(circlePictureView!)
        
        nameLabel = UILabel()
        nameLabel!.textColor = .loginRedColor()
        
        let username : String! = UserService.currentUser.username
        let adminText = "\(username) - Admin"
        let firstPart = username
//        nameLabel!.text = UserService.currentUser.username //cambiar por name
        nameLabel!.font = UIFont.appLatoFontOfSize(14)
        nameLabel!.adjustsFontSizeToFitWidth = true
        nameLabel!.textAlignment = .Center
        nameLabel!.numberOfLines = 1
        
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(
            string: adminText,
            attributes: [NSFontAttributeName:UIFont(
                name: "Lato-Regular",
                size: 16.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor() , range: NSRange(location: 0, length: firstPart!.characters.count + 3))
        
        nameLabel?.attributedText = myMutableString
        
        self.addSubview(nameLabel!)
        
        
//        leyendLabel = UILabel()
//        leyendLabel!.textColor = .whiteColor()
//        leyendLabel!.text = "A lo hecho pecho!"
//        leyendLabel!.font = UIFont.appLatoFontOfSize(14)
//        leyendLabel!.adjustsFontSizeToFitWidth = true
//        leyendLabel!.textAlignment = .Center
//        leyendLabel!.numberOfLines = 1
//        self.addSubview(leyendLabel!)
        
        leyendLabel = UITextField()
        leyendLabel?.delegate = self
        leyendLabel!.attributedPlaceholder =  NSAttributedString(string: "Ingresá tu frase personal!",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        leyendLabel!.textColor = .whiteColor()
        leyendLabel!.font = UIFont.appLatoFontOfSize(16)
        leyendLabel!.adjustsFontSizeToFitWidth = true
        leyendLabel!.keyboardType = UIKeyboardType.Default
        leyendLabel!.clearButtonMode = .WhileEditing
        leyendLabel!.textAlignment = .Center
        self.addSubview(leyendLabel!)

        setupConstrains()
    }
//
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
//
//    override func setItems(myDictionary: NSDictionary) {
//        if let left_icon = myDictionary["left_icon"] as? String{
//            leftIcon!.image = UIImage(named: left_icon)
//        }
//        if let right_icon = myDictionary["right_icon"] as? String{
//            rightButton!.setImage(UIImage(named: right_icon), forState: UIControlState.Normal)
//        }
//        if let title = myDictionary["title"] as? String{
//            titleLabel!.text = title
//        }
//    }
//    
    func setupConstrains(){
        
        circlePictureView?.autoAlignAxis(.Vertical, toSameAxisOfView: self)
        circlePictureView?.autoPinEdge(.Top, toEdge: .Top, ofView: self, withOffset: 15)
        
        nameLabel?.autoPinEdge(.Top, toEdge: .Bottom, ofView: circlePictureView!, withOffset: 15)
        nameLabel?.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        nameLabel?.autoPinEdge(.Right, toEdge: .Right, ofView: self)

        leyendLabel?.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameLabel!, withOffset: 5)
        leyendLabel?.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        leyendLabel?.autoPinEdge(.Right, toEdge: .Right, ofView: self)

    }
    
}
