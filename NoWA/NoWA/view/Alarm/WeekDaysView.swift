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
        self.addSubview(lunes!)
        
        martes = CircleDayView(day: "Ma" , frame: CGRect())
        self.addSubview(martes!)

        miercoles = CircleDayView(day: "Mi" , frame: CGRect())
        self.addSubview(miercoles!)

        jueves = CircleDayView(day: "J" , frame: CGRect())
        self.addSubview(jueves!)

        viernes = CircleDayView(day: "V" , frame: CGRect())
        self.addSubview(viernes!)

        sabado = CircleDayView(day: "S" , frame: CGRect())
        self.addSubview(sabado!)

        domingo = CircleDayView(day: "D" , frame: CGRect())
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

}
