//
//  InfoViewController.swift
//  Lose It!
//
//  Created by Abeer Nasir on 07/09/2021.
//

import Foundation
import UIKit

class InfoViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var enterLabel: UIButton!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        ageTextField.delegate=self
        super.viewDidLoad()
    
        
        // Do any additional setup after loading the view.
    }
   
        
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.0f", sender.value)
        heightLabel.text = "\(height)Cm"
       
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }

    
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        
        let weight = weightSlider.value
       
        let age = Float(ageTextField.text ?? "0") ?? 0
        
        
        calculatorBrain.calculateCalories(height: height, weight: weight, age: age)
        performSegue(withIdentifier: "goToEstimate", sender: self)
        
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEstimate" {
            let destinationVC = segue.destination as! EstimateViewController
            destinationVC.caloriesValue = calculatorBrain.getCaloriesValue()
        }
    
    }
   
}

