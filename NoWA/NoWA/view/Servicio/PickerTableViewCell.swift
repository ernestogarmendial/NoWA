//
//  PickerTableViewCell
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 24/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class PickerTableViewCell: GenericTableViewCell {
    
    var titleLabel : UILabel?
    var descriptionLabel : UILabel?
    var selectedLabel : UILabel?
    var leftIcon : UIImageView?
    var rightButton : UIButton?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .registroGrayColor()
        self.contentView.backgroundColor = .registroGrayColor()
        
        
        leftIcon = UIImageView()
        leftIcon!.contentMode = UIViewContentMode.Center
        self.addSubview(leftIcon!)
        
        titleLabel = UILabel()
        titleLabel!.textColor = .whiteColor()
        titleLabel!.font = UIFont.appLatoFontOfSize(14)
        titleLabel!.adjustsFontSizeToFitWidth = true
        titleLabel!.textAlignment = .Left
        titleLabel!.numberOfLines = 1
        self.addSubview(titleLabel!)
        
        descriptionLabel = UILabel()
        descriptionLabel!.text = "LLuvioso (Hardcode)"
        descriptionLabel!.textColor = .whiteColor()
        descriptionLabel!.font = UIFont.appLatoFontOfSize(14)
        descriptionLabel!.adjustsFontSizeToFitWidth = true
        descriptionLabel!.textAlignment = .Left
        descriptionLabel!.numberOfLines = 1
        self.addSubview(descriptionLabel!)
        
        rightButton = UIButton()
        rightButton!.addTarget(self, action: "rightButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.addSubview(rightButton!)
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setItems(myDictionary: NSDictionary) {
        
        if let left_icon = myDictionary["left_icon"] as? String{
            leftIcon!.image = UIImage(named: left_icon)
            
        }
        
        if let right_icon = myDictionary["right_icon"] as? String{
            rightButton!.setImage(UIImage(named: right_icon), forState: UIControlState.Normal)
            
        }
        
        if let title = myDictionary["title"] as? String{
            titleLabel!.text = title
            
        }
    }
    
    func setupConstrains(){
        
        leftIcon!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        leftIcon!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        leftIcon!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        leftIcon!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.20)
        
        titleLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
//        titleLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        titleLabel!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        titleLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        titleLabel!.autoMatchDimension(.Height, toDimension: .Height, ofView: self, withMultiplier: 0.80)
        
        descriptionLabel!.autoConstrainAttribute(.MarginTop, toAttribute: .MarginBottom, ofView: self, withMultiplier: 0.5)
        descriptionLabel!.autoPinEdge(.Left, toEdge: .Right, ofView: leftIcon!)
        descriptionLabel!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        descriptionLabel!.autoMatchDimension(.Width, toDimension: .Width, ofView: self, withMultiplier: 0.60)
        
        rightButton!.autoPinEdge(.Left, toEdge: .Right, ofView: titleLabel!)
        rightButton!.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: self)
        rightButton!.autoPinEdge(.Top, toEdge: .Top, ofView: self)
        rightButton!.autoPinEdge(.Right, toEdge: .Right, ofView: self)
    }
    
    func rightButtonPressed(){
        print("pepe")
        
        callService()

    }
    
    func callService(){
        
        let weatherService : WeatherService = WeatherService()
        weatherService.getForecasts(token: UserService.currentUser.token,target: self,message: "getForecastsFinish:")
    }
    
    
    
    
    func getForecastsFinish (result : ServiceResult!){
        if(result.hasErrors()){
            print("Error papu")
            return
        }
        
//        self.forecasts = (result.entityForKey("Forecasts") as? WeatherDTO)
        

    }
}
