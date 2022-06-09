//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by alexis kreager on 4/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var finalBill = "0.00"
    var tipPercentage = 10
    var peopleSplit = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = finalBill
        settingsLabel.text = "Split between \(peopleSplit) people with \(tipPercentage)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
