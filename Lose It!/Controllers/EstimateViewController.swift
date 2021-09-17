//
//  EstimateViewController.swift
//  Lose It!
//
//  Created by Abeer Nasir on 07/09/2021.
//

import Foundation
import UIKit

class EstimateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    var caloriesValue: String?
    @IBOutlet weak var caloriesLabel: UILabel!
   
     override func viewDidLoad() {
        super.viewDidLoad()
      
        caloriesLabel.text = caloriesValue
    }
    
    @IBAction func beginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToMyDay", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabVC = segue.destination as? UITabBarController {
            if let navVC = tabVC.viewControllers!.first as? UINavigationController {
                if let nextVC =  navVC.viewControllers.first as? MyDayViewController{
            nextVC.caloriesVal = caloriesValue
        }
}
        }}}
