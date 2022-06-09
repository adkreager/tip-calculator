//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip: Double = 0.10
    var split: Int = 2
    var bill: Double = 0.00
    var total: Double = 0.00

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender == tenPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
        
        let tipPercentage: String = sender.currentTitle!
        let tipWithoutPercentSign = tipPercentage.dropLast()
        let tipAsADouble = Double(tipWithoutPercentSign)!
        tip = tipAsADouble / 100
        
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = Int(sender.value)
        splitNumberLabel.text = String(split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bill = Double(billTextField.text!) ?? 0.00
        let unroundedTotal = (bill * (1 + tip)) / Double(split)
        
        total = (round(unroundedTotal * 100) / 100.0)
        
        performSegue(withIdentifier: "resultsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultsSegue" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalBill = String(total)
            destinationVC.tipPercentage = Int(tip)
            destinationVC.peopleSplit = split
        }
    }
    
}

