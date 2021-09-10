//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Shreesha on 11/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = "0.0"
    
    var tip = 10.0
    
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
