//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    
    
    var selectedTipPercentage: Double = 0.0
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false

        tenPctButton.isSelected = false

        twentyPctButton.isSelected = false
            
        sender.isSelected = true
        
        switch sender {
        case zeroPctButton:
                    selectedTipPercentage = 0.0
                    print(selectedTipPercentage)
        case tenPctButton:
                    selectedTipPercentage = 0.1
                    print(selectedTipPercentage)
        case twentyPctButton:
                    selectedTipPercentage = 0.2
                    print(selectedTipPercentage)
        default:
                    selectedTipPercentage = 0.0
                    print(selectedTipPercentage)
            }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showResults" {
                let destinationVC = segue.destination as! ResultsViewController
                // Retrieve the bill amount, ensuring it's converted to a Double
                let billAmount = Double(billTextField.text ?? "0.0") ?? 0.0
                let numberOfPeople = Int(splitStepper.value)
                
                // Calculate the tip amount
                let tipAmount = billAmount * selectedTipPercentage
                
                // Calculate the total amount (bill + tip)
                let totalAmount = billAmount + tipAmount
                
                // Calculate the amount per person
                let amountPerPerson = totalAmount / Double(numberOfPeople)
                
                // Pass the calculated amount to the ResultsViewController
                destinationVC.amountPerPerson = String(format: "%.2f", amountPerPerson)
                destinationVC.numberOfPeople = numberOfPeople
                destinationVC.tipPercentage = selectedTipPercentage
            }
        }
    
    
}

