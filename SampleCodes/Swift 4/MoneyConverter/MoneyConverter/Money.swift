//
//  Money.swift
//  MoneyConverter
//
//  Created by Hakyung Noa on 05/11/2017.
//  Copyright © 2017 Hakyung Noah. All rights reserved.
//

import Foundation
import MapKit

enum Currency:Int {
    case usd = 0, krw, jpy, eur
    
    //Money symbol
    var symbol:String {
        get {
            switch self {
            case .usd : return "$"
            case .krw : return "₩"
            case .jpy : return "¥"
            case .eur : return "€"
            }
        }
    }
    
    //Convert ration
    var ratio:Double {
        get {
            switch self {
            case .usd : return 1.0
            case .krw : return 1115.5
            case .jpy : return 114.0
            case .eur : return 0.86
            }
        }
    }
}


struct Money {
    
    var usdollar = 0.0
    
    init(_ _usdollar:Double){
        usdollar = _usdollar
    }
    
    init(_ amount:Double, currency:Currency){
        usdollar = amount / currency.ratio
    }
    
    func valueInCurrency(_ currency:Currency) -> String {
        let convertedMoney = usdollar*currency.ratio
        //Format currency
        let fmt = NumberFormatter()
        fmt.numberStyle = NumberFormatter.Style.decimal
        
        guard let formattedMoney = fmt.string(for: convertedMoney) else {
            return "Error"
        }
        return "\(currency.symbol) " + "\(String(describing: formattedMoney))"
    }
}

//let money = Money(120.0)
//let koreanIncome = Money(500_000 , currency:.krw)
