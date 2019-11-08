//
//  ViewController.swift
//  Tipulator
//
//  Created by Jorge Alejandre on 11/18/18.
//  Copyright © 2018 Jorge Alejandre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipStepper: UIStepper!
    @IBOutlet weak var tipValueLabel: UILabel!
    @IBOutlet weak var personStepper: UIStepper!
    @IBOutlet weak var personValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipStepper.wraps = true
        tipStepper.autorepeat = true
        tipStepper.minimumValue = 10
        tipStepper.maximumValue = 25
        
        personStepper.wraps = true
        personStepper.autorepeat = true
        personStepper.minimumValue = 1
        personStepper.maximumValue = 10
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tipStepperValue(_ sender: UIStepper) {
        tipValueLabel.text = "\(Double(sender.value).description)%" 
        calculate()
    }
    
    
    @IBAction func personStepperValue(_ sender: UIStepper) {
        personValueLabel.text = Double(sender.value).description
        calculate()
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    @IBAction func calcTip(_ sender: Any) {
        calculate()
    }
    
    func calculate() {
        let bill = Double(billField.text!) ?? 0
        
        let tip = (bill * (tipStepper.value)) / 100
        let personTip = tip / (personStepper.value)
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        personLabel.text = String(format: "$%.2f", personTip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}




