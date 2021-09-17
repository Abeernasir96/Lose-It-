//
//  SearchViewController.swift
//  Lose It!
//
// 
//

import UIKit

enum MealType {
    case breakfast
    case lunch
    case dinner
    case none
}

protocol DataDelegate {
    func updateLogCalories(str: String?, mealType: MealType)
}

class SearchViewController: UIViewController,UITextFieldDelegate,CalorieManagerDelegate{
    
    
   
    
    var delagate: DataDelegate? 
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    var calorieManager = CalorieManager()
    var logCals : String?
    var mealType: MealType = .none
    @IBOutlet weak var addButtonPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calorieManager.delegate=self
        searchTF.delegate=self
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        searchTF.endEditing(true)
        print(searchTF.text!)
    }
   
  
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        delagate?.updateLogCalories(str: logCals, mealType: mealType)
        self.dismiss(animated: true, completion: nil)
        
        
 
    }
   

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTF.endEditing(true)
        print(searchTF.text!)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTF.text != "" {
            return true
        } else {
            searchTF.placeholder = "Type something"
            return false
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let food = searchTF.text{
            calorieManager.fetchCalorie(foodName: food)
        }
        searchTF.text = ""
    }
    
    
    func didUpdateCalorie(_ calorieManager:CalorieManager, calorie:CalorieModel){
        DispatchQueue.main.async { [self] in
            self.calorieLabel.text = calorie.CalorieString
            self.foodNameLabel.text = calorie.item
            logCals = calorie.CalorieString
            

        }
       
     
    }
    
   
}


