//
//  ViewController.swift
//  MoneyConverter
//
//  Created by Hakyung Noa on 05/11/2017.
//  Copyright © 2017 Hakyung Noah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currencySegment: UISegmentedControl!
    @IBOutlet var sourceMoneyField: UITextField!
    @IBOutlet var targetDollar: UILabel!
    @IBOutlet var targetKRW: UILabel!
    @IBOutlet var targetJPY: UILabel!
    @IBOutlet var targetEUR: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertMoney(_ sender: Any) {
        
        guard let sourceCurrecy = Currency(rawValue:currencySegment.selectedSegmentIndex) else {
            print("Source Currency Error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            targetDollar.text = "Error"
            targetKRW.text = "Error"
            targetJPY.text = "Error"
            targetEUR.text = "Error"
            return
        }
        
        let sourceMoney = Money(sourceAmount, currency: sourceCurrecy)
        
        let targetDollarOutput = sourceMoney.valueInCurrency(Currency.init(rawValue: 0)!)
        let targetKrwOutput = sourceMoney.valueInCurrency(Currency.init(rawValue: 1)!)
        let targetJpyOutput = sourceMoney.valueInCurrency(Currency.init(rawValue: 2)!)
        let targetEurOutput = sourceMoney.valueInCurrency(Currency.init(rawValue: 3)!)

        targetDollar.text = targetDollarOutput
        targetKRW.text = targetKrwOutput
        targetJPY.text = targetJpyOutput
        targetEUR.text = targetEurOutput
        
        
//        for i in 0 ... 3 {
//            targetMoneyString += sourceMoney.valueInCurrency(Currency.init(rawValue: i)!)
//            targetMoneyString += "\r\n"
//        }
//
//        targetMoneyLabel.text = targetMoneyString
        
    }
    
}

