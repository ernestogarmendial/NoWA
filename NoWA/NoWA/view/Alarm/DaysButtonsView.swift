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

}
