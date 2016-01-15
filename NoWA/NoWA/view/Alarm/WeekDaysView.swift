//
//  WeekDaysView.swift
//  NoWA
//
//  Created by Ernesto Garmendia Luis on 21/12/15.
//  Copyright © 2015 Ernesto Garmendia Luis. All rights reserved.
//

import UIKit

class WeekDaysView: UIView {
    
    var lunes : CircleDayView?
    var martes : CircleDayView?
    var miercoles : CircleDayView?
    var jueves : CircleDayView?
    var viernes : CircleDayView?
    var sabado : CircleDayView?
    var domingo : CircleDayView?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        lunes = CircleDayView(day: "L" , frame: CGRect())
        lunes!.hidden = true
        self.addSubview(lunes!)
        
        martes = CircleDayView(day: "Ma" , frame: CGRect())
        martes!.hidden = true
        self.addSubview(martes!)
        
        miercoles = CircleDayView(day: "Mi" , frame: CGRect())
        miercoles!.hidden = true
        self.addSubview(miercoles!)
        
        jueves = CircleDayView(day: "J" , frame: CGRect())
        jueves!.hidden = true
        self.addSubview(jueves!)
        
        viernes = CircleDayView(day: "V" , frame: CGRect())
        viernes!.hidden = true
        self.addSubview(viernes!)
        
        sabado = CircleDayView(day: "S" , frame: CGRect())
        sabado!.hidden = true
        self.addSubview(sabado!)
        
        domingo = CircleDayView(day: "D" , frame: CGRect())
        domingo!.hidden = true
        self.addSubview(domingo!)
        
        setupConstrains()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    func setupConstrains(){
        
        lunes!.autoPinEdge(.Left, toEdge: .Left, ofView: self)
        lunes!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        martes!.autoPinEdge(.Left, toEdge: .Right, ofView: lunes!, withOffset: 5)
        martes!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        miercoles!.autoPinEdge(.Left, toEdge: .Right, ofView: martes!, withOffset: 5)
        miercoles!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        jueves!.autoPinEdge(.Left, toEdge: .Right, ofView: miercoles!, withOffset: 5)
        jueves!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        viernes!.autoPinEdge(.Left, toEdge: .Right, ofView: jueves!, withOffset: 5)
        viernes!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        sabado!.autoPinEdge(.Left, toEdge: .Right, ofView: viernes!, withOffset: 5)
        sabado!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
        domingo!.autoPinEdge(.Left, toEdge: .Right, ofView: sabado!, withOffset: 5)
        domingo!.autoAlignAxis(.Horizontal, toSameAxisOfView: self)
        
    }
    
    func showDays(days : NSArray){
        
        for day in days{
            
            switch (day as! String ) {
            case "1":
                lunes?.hidden = false
            case "2":
                martes?.hidden = false
            case "3":
                miercoles?.hidden = false
            case "4":
                jueves?.hidden = false
            case "5":
                viernes?.hidden = false
            case "6":
                sabado?.hidden = false
            case "7":
                domingo?.hidden = false
            default:
                print("default case")
            }
        }
        
    }
    
}
