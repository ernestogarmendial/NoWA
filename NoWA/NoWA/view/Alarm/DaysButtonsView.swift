//
//  DaysButtonsView.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 17/1/16.
//  Copyright © 2016 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class DaysButtonsView: UIView {
    
    var lunes : CircleDayButtonView?
    var martes : CircleDayButtonView?
    var miercoles : CircleDayButtonView?
    var jueves : CircleDayButtonView?
    var viernes : CircleDayButtonView?
    var sabado : CircleDayButtonView?
    var domingo : CircleDayButtonView?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        lunes = CircleDayButtonView(day: "L" , frame: CGRect())
        self.addSubview(lunes!)
        
        martes = CircleDayButtonView(day: "Ma" , frame: CGRect())
        self.addSubview(martes!)
        
        miercoles = CircleDayButtonView(day: "Mi" , frame: CGRect())
        self.addSubview(miercoles!)
        
        jueves = CircleDayButtonView(day: "J" , frame: CGRect())
        self.addSubview(jueves!)
        
        viernes = CircleDayButtonView(day: "V" , frame: CGRect())
        self.addSubview(viernes!)
        
        sabado = CircleDayButtonView(day: "S" , frame: CGRect())
        self.addSubview(sabado!)
        
        domingo = CircleDayButtonView(day: "D" , frame: CGRect())
        self.addSubview(domingo!)
        
        setupConstrains()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    func setupConstrains(){
        
        lunes!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        lunes!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        martes!.autoPinEdge(.Left, toEdge: .Right, ofView: lunes!, withOffset: 10)
        martes!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        miercoles!.autoPinEdge(.Left, toEdge: .Right, ofView: martes!, withOffset: 10)
        miercoles!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        jueves!.autoPinEdge(.Left, toEdge: .Right, ofView: miercoles!, withOffset: 10)
        jueves!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        viernes!.autoPinEdge(.Left, toEdge: .Right, ofView: jueves!, withOffset: 10)
        viernes!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        sabado!.autoPinEdge(.Left, toEdge: .Right, ofView: viernes!, withOffset: 10)
        sabado!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        domingo!.autoPinEdge(.Left, toEdge: .Right, ofView: sabado!, withOffset: 10)
        domingo!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
    }

    
    func setDaysColor(color : UIColor){
        lunes?.backgroundColor = color
        martes?.backgroundColor = color
        miercoles?.backgroundColor = color
        jueves?.backgroundColor = color
        viernes?.backgroundColor = color
        sabado?.backgroundColor = color
        domingo?.backgroundColor = color
    }
    
    
    func showDays(days : NSArray, color : UIColor, isActive : Bool){
                
        for day in days{
            
            switch (day as! String ) {
            case "1":
                lunes?.backgroundColor = color
                if isActive {
                    lunes?.isActive = true
                }else{
                    lunes?.isActive = false
                }
            case "2":
                martes?.backgroundColor = color
                if isActive {
                    martes?.isActive = true
                }else{
                    martes?.isActive = false
                }
            case "3":
                miercoles?.backgroundColor = color
                if isActive {
                    miercoles?.isActive = true
                }else{
                    miercoles?.isActive = false
                }
            case "4":
                jueves?.backgroundColor = color
                if isActive {
                    jueves?.isActive = true
                }else{
                    jueves?.isActive = false
                }
            case "5":
                viernes?.backgroundColor = color
                if isActive {
                    viernes?.isActive = true
                }else{
                    viernes?.isActive = false
                }
            case "6":
                sabado?.backgroundColor = color
                if isActive {
                    sabado?.isActive = true
                }else{
                    sabado?.isActive = false
                }
            case "7":
                domingo?.backgroundColor = color
                if isActive {
                    domingo?.isActive = true
                }else{
                    domingo?.isActive = false
                }
            default:
                print("default case")
            }
        }
        
    }
}
