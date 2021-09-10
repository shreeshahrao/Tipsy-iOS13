//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Shreesha on 11/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UILabel!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBOutlet weak var billText: UITextField!
    
    var tip = 0.10
    
    var numberofPeople = 2
    
    var billTotal = 0.0
    
    var finalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitlenotPercentageSign = String(buttonTitle.dropLast())
        
        let buttonTitleNumber = Double(buttonTitlenotPercentageSign)!
        
        tip = buttonTitleNumber / 100
        
        print(tip)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberofPeople = Int(sender.value)
        
        print(numberofPeople)
        
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let  bill = billText.text!
        
        if bill != "" {
            
             billTotal = Double(bill)!
            
            print(billTotal)
            
            let result = billTotal * ( 1  + tip) / Double(numberofPeople)
            
            finalResult = String(format: "%0.2f", result)
            
            print(finalResult)
            
            self.performSegue(withIdentifier: "calculateSegue", sender: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateSegue" {
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.tip = tip
            destinationVC.split = numberofPeople
            
        }
    }
    
}
