//
//  GenericTableViewCell.swift
//  NoWA
//
//  Created by Ernesto Garmendia on 12/10/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class GenericTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var firstTimeEdit : Bool? = false
    
    var defaultSeted : Bool! = false
    
    var editSeted : Bool! = false
    
    var resetedValues : Bool? = false
    
    var alarmStatus : NSNumber?
    
    
    
    var defaultDTO : AlarmDTO?{
        didSet{
            setDefaults(defaultDTO!, isCreate: false)
        }
    }
    
    var editAlarmDTO : PersonalAlarmDTO?{
        didSet{
            setEditAlarm(editAlarmDTO!, isEdit: false, status: alarmStatus)
        }
    }
    
    var editTournamentDTO : TournamentDTO?{
        didSet{
            setEditTournament(editTournamentDTO!, isEdit: false, status: alarmStatus)
        }
    }
    
    var webDelegate : WebButtonDelegate?
    
    var shareDelegate : ShareSocialTableViewCellDelegate?

    var buttonDelegate : ButtonFooterDelegate?
    
    var defaultDelegate : DefaultCellDelegate?
    
    
    var locationDelegate : LocationTableViewCellDelegate?
    
    var myDictionary : NSDictionary? {
        didSet{
            setItems(myDictionary!)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.darkGrayCustomColor()
        self.layoutMargins = UIEdgeInsetsZero
        self.selectionStyle = .None
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setItems(myDictionary: NSDictionary){
        
    }
    
    func setDefaults(defaultDTO: AlarmDTO, isCreate: Bool){
        
    }
    
    func resetValues(){
        
    }
    
    func setEditAlarm(editAlarmDTO: PersonalAlarmDTO, isEdit: Bool, status: NSNumber?){
        
    }
    
    func setEditTournament(editTournamentDTO: TournamentDTO, isEdit: Bool, status: NSNumber?){
        
    }
    
    func hideRepetition(){
        
    }
    
}
