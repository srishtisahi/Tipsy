//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Srishti Sahi on 03/06/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amountPerPerson: String?
    var numberOfPeople: Int?
    var tipPercentage: Double?

    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = amountPerPerson
        
        if let numberOfPeople = numberOfPeople, let tipPercentage = tipPercentage {
                    settingsLabel.text = "Split between \(numberOfPeople) people with a \(Int(tipPercentage * 100))% tip."
                }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
